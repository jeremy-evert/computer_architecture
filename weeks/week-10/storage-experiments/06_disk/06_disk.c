#define _POSIX_C_SOURCE 200809L
#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/statvfs.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>
#ifdef __linux__
#include <sys/vfs.h>
#endif

#define CHUNK (4U * 1024U * 1024U)
#define DEFAULT_SIZE (256ULL * 1024ULL * 1024ULL)
/* The volatile sink consumes sampled bytes so the read loops stay observable. */
static volatile uint64_t sink;
static char cleanup_file[4096]; static char cleanup_dir[4096]; static int cleanup_own_dir;
static void cleanup(void){if(cleanup_file[0])unlink(cleanup_file);if(cleanup_own_dir&&cleanup_dir[0])rmdir(cleanup_dir);}
static double now_s(void) { struct timespec t; if (clock_gettime(CLOCK_MONOTONIC, &t)) { perror("clock_gettime"); exit(1); } return (double)t.tv_sec + (double)t.tv_nsec / 1e9; }
static void full_write(int fd, const void *buf, size_t n) { const char *p=buf; while(n) { ssize_t k=write(fd,p,n); if(k<0 && errno==EINTR) continue; if(k<=0){perror("write");exit(1);} p+=k; n-=(size_t)k; } }
static void full_read(int fd, void *buf, size_t n) { char *p=buf; while(n) { ssize_t k=read(fd,p,n); if(k<0 && errno==EINTR)continue; if(k<=0){perror("read");exit(1);} p+=k;n-=(size_t)k; } }
static void syncfd(int fd) { if(fsync(fd)){perror("fsync");exit(1);} }
static void trial(const char *path, size_t bytes, int mode, double *write_s, double *warm_s, double *cold_s) {
 int fd=open(path,O_CREAT|O_TRUNC|O_RDWR,0600); if(fd<0){perror("open scratch file");exit(1);} char *b=malloc(CHUNK); if(!b){perror("malloc");exit(1);} for(size_t i=0;i<CHUNK;i++) b[i]=(char)(i*31U+7U);
 double a=now_s(); size_t left=bytes; while(left){size_t n=left<CHUNK?left:CHUNK; full_write(fd,b,n); left-=n; if(mode==2)syncfd(fd);} if(mode==1)syncfd(fd); *write_s=now_s()-a;
 if(lseek(fd,0,SEEK_SET)<0){perror("lseek");exit(1);} a=now_s(); left=bytes; uint64_t sum=0; while(left){size_t n=left<CHUNK?left:CHUNK; full_read(fd,b,n); for(size_t i=0;i<n;i+=4096)sum+=(unsigned char)b[i]; left-=n;} *warm_s=now_s()-a; sink+=sum;
 syncfd(fd);
#if defined(POSIX_FADV_DONTNEED)
 (void)posix_fadvise(fd,0,0,POSIX_FADV_DONTNEED);
#endif
 if(lseek(fd,0,SEEK_SET)<0){perror("lseek");exit(1);} a=now_s(); left=bytes; sum=0; while(left){size_t n=left<CHUNK?left:CHUNK; full_read(fd,b,n); for(size_t i=0;i<n;i+=4096)sum+=(unsigned char)b[i]; left-=n;} *cold_s=now_s()-a; sink+=sum;
 close(fd); free(b);
}
int main(int argc,char **argv){
 char templ[]="/tmp/arch-disk-XXXXXX"; const char *dir=argc>1?argv[1]:mkdtemp(templ); size_t bytes=argc>2?(size_t)strtoull(argv[2],NULL,10):(size_t)DEFAULT_SIZE; if(!dir||bytes==0){fprintf(stderr,"usage: %s [scratch-dir] [bytes]\n",argv[0]);return 2;}
 if(strlen(dir)>=sizeof cleanup_dir){fprintf(stderr,"scratch path too long\n");return 1;}memcpy(cleanup_dir,dir,strlen(dir)+1);cleanup_own_dir=1;atexit(cleanup); struct stat st; if(stat(dir,&st)||!S_ISDIR(st.st_mode)){perror("scratch directory");return 1;} char file_template[4096]; if(snprintf(file_template,sizeof file_template,"%s/disk-bench-XXXXXX",dir)>=(int)sizeof file_template){fprintf(stderr,"path too long\n");return 1;} int seed=mkstemp(file_template);if(seed<0){perror("mkstemp scratch file");return 1;}close(seed);memcpy(cleanup_file,file_template,strlen(file_template)+1);
 char host[256]="unknown",cpu[256]="unknown",date[64]="unknown"; gethostname(host,sizeof host); host[sizeof host-1]=0;
 FILE *cf=fopen("/proc/cpuinfo","r");if(cf){char line[512];while(fgets(line,sizeof line,cf))if(!strncmp(line,"model name",10)){char *p=strchr(line,':');if(p){snprintf(cpu,sizeof cpu,"%s",p+2);cpu[strcspn(cpu,"\n")]=0;}break;}fclose(cf);}time_t tt=time(NULL);struct tm tm;if(gmtime_r(&tt,&tm))strftime(date,sizeof date,"%Y-%m-%dT%H:%M:%SZ",&tm);
 printf("# experiment=disk\n# host=%s\n# cpu=%s\n# date_utc=%s\n# flags=-std=c11 -O2 -Wall -Wextra\n",host,cpu,date);
#ifdef __linux__
 struct statfs fs; if(statfs(dir,&fs)==0){{unsigned long t=(unsigned long)fs.f_type; const char*n=t==0xef53UL?"ext2/3/4":t==0x01021994UL?"tmpfs":t==0x58465342UL?"xfs":t==0x9123683eUL?"btrfs":"unknown"; printf("# filesystem_type=0x%lx (%s)\n",t,n);} if((unsigned long)fs.f_type==0x01021994UL)puts("# WARNING: tmpfs is RAM, not disk");} else perror("statfs");
#else
 puts("# filesystem_type=use df -T on this platform");
#endif
 printf("# bytes=%zu\ntrial,method,write_MB_s,warm_read_MB_s,cold_read_MB_s,cold_warm_ratio\n",bytes);
 double warm[3]; trial(cleanup_file,bytes,1,&warm[0],&warm[1],&warm[2]); unlink(cleanup_file);
 double results[3][3][3]; const char *names[]={"buffered","one_fsync","fsync_each_4MiB"};
 for(int m=0;m<3;m++){for(int t=0;t<3;t++){trial(cleanup_file,bytes,m,&results[m][t][0],&results[m][t][1],&results[m][t][2]);printf("%d,%s,%.2f,%.2f,%.2f,%.3f\n",t+1,names[m],bytes/1e6/results[m][t][0],bytes/1e6/results[m][t][1],bytes/1e6/results[m][t][2],results[m][t][2]/results[m][t][1]);unlink(cleanup_file);}double w[3],r[3],c[3];for(int t=0;t<3;t++){w[t]=bytes/1e6/results[m][t][0];r[t]=bytes/1e6/results[m][t][1];c[t]=bytes/1e6/results[m][t][2];}for(int i=0;i<3;i++)for(int j=i+1;j<3;j++){if(w[i]>w[j]){double x=w[i];w[i]=w[j];w[j]=x;}if(r[i]>r[j]){double x=r[i];r[i]=r[j];r[j]=x;}if(c[i]>c[j]){double x=c[i];c[i]=c[j];c[j]=x;}}printf("# median,%s,%.2f,%.2f,%.2f\n",names[m],w[1],r[1],c[1]);}
 double ratio=results[1][2][2]/results[1][2][1]; if(ratio<1.2)puts("# cold read was not clearly slower; page cache may not have been dropped without root privileges");
 char small[4096]={0}; int fd=open(cleanup_file,O_CREAT|O_TRUNC|O_RDWR,0600); if(fd<0){perror("small-write open");return 1;} double a=now_s(); for(int i=0;i<2000;i++){full_write(fd,small,sizeof small);if(fdatasync(fd)){perror("fdatasync");return 1;}} double elapsed=now_s()-a; printf("# small_writes=2000 x 4096 bytes\n# fdatasync_ms_per_sync=%.4f\n",elapsed*1000/2000); close(fd); unlink(cleanup_file); cleanup_file[0]=0; if(rmdir(dir)!=0&&argc<=1){perror("rmdir scratch");return 1;} cleanup_own_dir=0; return sink==UINT64_MAX?1:0;
}
