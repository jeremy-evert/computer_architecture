#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

static volatile uint64_t sink;
static uint32_t random_state=0x51a7c3d9u;
static uint32_t random_u32(void){uint32_t x=random_state;x^=x<<13;x^=x>>17;x^=x<<5;random_state=x;return x;}
static double now_ns(void){struct timespec t;if(clock_gettime(CLOCK_MONOTONIC,&t)!=0)exit(2);return(double)t.tv_sec*1e9+(double)t.tv_nsec;}
static double median(double a,double b,double c){if(a>b){double t=a;a=b;b=t;}if(b>c){double t=b;b=c;c=t;}if(a>b)b=a;return b;}
static size_t cache_capacity(unsigned wanted_level){
    size_t max=0;char path[256],line[64];
    for(unsigned i=0;i<32;i++){
        unsigned level=0;snprintf(path,sizeof path,"/sys/devices/system/cpu/cpu0/cache/index%u/level",i);FILE*f=fopen(path,"r");if(!f)break;if(fscanf(f,"%u",&level)!=1){fclose(f);continue;}fclose(f);if(level!=wanted_level)continue;
        snprintf(path,sizeof path,"/sys/devices/system/cpu/cpu0/cache/index%u/type",i);f=fopen(path,"r");if(!f)continue;char type[64]="";if(!fgets(type,sizeof type,f)){fclose(f);continue;}type[strcspn(type,"\r\n")]='\0';fclose(f);if(wanted_level==1&&strcmp(type,"Data")!=0)continue;
        snprintf(path,sizeof path,"/sys/devices/system/cpu/cpu0/cache/index%u/size",i);f=fopen(path,"r");if(!f)continue;if(fgets(line,sizeof line,f)){unsigned long long n=0;char unit=0;if(sscanf(line,"%llu%c",&n,&unit)>=1){size_t b=(size_t)n;if(unit=='K'||unit=='k')b*=1024;if(unit=='M'||unit=='m')b*=1024*1024;if(b>max)max=b;}}fclose(f);
    }return max;
}
static void metadata(void){
    char host[256]="unknown",cpu[256]="unknown",line[512];gethostname(host,sizeof host);host[sizeof host-1]='\0';FILE*f=fopen("/proc/cpuinfo","r");if(f){while(fgets(line,sizeof line,f))if(strncmp(line,"model name",10)==0){char*p=strchr(line,':');if(p){p+=2;p[strcspn(p,"\r\n")]='\0';snprintf(cpu,sizeof cpu,"%s",p);}break;}fclose(f);}
    char date[64]="unknown";f=popen("date -u +%Y-%m-%dT%H:%M:%SZ","r");if(f){if(fgets(date,sizeof date,f))date[strcspn(date,"\r\n")]='\0';pclose(f);}
    printf("# experiment=03_working_set\n# host=%s\n# cpu_model=%s\n# date_utc=%s\n# compiler_flags=-std=c11 -O2 -Wall -Wextra\n",host,cpu,date);
}
static size_t *sizes_for(size_t limit,size_t *count){
    size_t cap=32,n=0,*a=malloc(cap*sizeof *a);if(!a)return NULL;
    size_t x=4096;while(x<limit){if(n==cap){cap*=2;size_t*t=realloc(a,cap*sizeof*a);if(!t){free(a);return NULL;}a=t;}a[n++]=x;
        size_t y=(size_t)((double)x*1.189207115);y=((y+63)/64)*64;if(y<=x)y=x+64;x=y;
    }
    if(n==cap){cap++;size_t*t=realloc(a,cap*sizeof*a);if(!t){free(a);return NULL;}a=t;}a[n++]=x;*count=n;return a;
}
static int run_size(size_t bytes,size_t l1,size_t l2,size_t l3){
    const size_t hop=64;size_t nodes=bytes/hop;if(nodes<2||nodes>UINT32_MAX)return 0;
    size_t alloc_bytes=((bytes+63)/64)*64;uint32_t*next=NULL,*perm=NULL;
    if(posix_memalign((void**)&next,64,alloc_bytes)!=0||!next){fprintf(stderr,"allocation failed at %zu bytes\n",bytes);return 0;}
    perm=malloc(nodes*sizeof*perm);if(!perm){free(next);fprintf(stderr,"permutation allocation failed\n");return 0;}
    for(size_t i=0;i<nodes;i++)perm[i]=(uint32_t)i;
    for(size_t i=nodes-1;i>0;i--){size_t j=random_u32()%(i+1);uint32_t t=perm[i];perm[i]=perm[j];perm[j]=t;}
    for(size_t i=0;i<nodes;i++)next[(size_t)perm[i]*(hop/sizeof(uint32_t))]=perm[(i+1)%nodes];
    uint32_t idx=perm[0];
    /* Each address depends on the previous load, and each slot is one cache line apart. */
    for(size_t i=0;i<100000;i++)idx=next[(size_t)idx*16];
    double trial[3];
    for(int t=0;t<3;t++){
        size_t accesses=0;double s=now_ns(),e;
        do {
            for(size_t i=0;i<65536;i++)idx=next[(size_t)idx*16];
            accesses+=65536;e=now_ns();
        } while(e-s<50000000.0);
        sink+=idx;trial[t]=(e-s)/(double)accesses;
        printf("%zu,%s,%s,%s,%d,%.6f\n",bytes,bytes<=l1?"yes":"no",bytes<=l2?"yes":"no",bytes<=l3?"yes":"no",t+1,trial[t]);
    }
    printf("%zu,%s,%s,%s,median,%.6f\n",bytes,bytes<=l1?"yes":"no",bytes<=l2?"yes":"no",bytes<=l3?"yes":"no",median(trial[0],trial[1],trial[2]));
    free(perm);free(next);return 1;
}
int main(void){
    size_t l1=cache_capacity(1),l2=cache_capacity(2),l3=cache_capacity(3);size_t last=l3?l3:(l2?l2:l1);if(!last){fprintf(stderr,"cache size is unavailable in sysfs\n");return 2;}
    size_t count=0;size_t*sizes=sizes_for(last*4,&count);if(!sizes){fprintf(stderr,"size list allocation failed\n");return 2;}
    metadata();printf("# cpu0_l1_bytes=%zu\n# cpu0_l2_bytes=%zu\n# cpu0_l3_bytes=%zu\n",l1,l2,l3);
    puts("size_bytes,fits_l1d,fits_l2,fits_l3,trial,ns_per_access");
    for(size_t i=0;i<count;i++)if(!run_size(sizes[i],l1,l2,l3)){free(sizes);return 2;}
    free(sizes);return sink==UINT64_MAX?1:0;
}
