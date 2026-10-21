#define _POSIX_C_SOURCE 200809L
#include <errno.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#define N 100000
static volatile unsigned char sink;
static double now_s(void){struct timespec t;if(clock_gettime(CLOCK_MONOTONIC,&t)){perror("clock_gettime");exit(1);}return (double)t.tv_sec+t.tv_nsec/1e9;}
static void exact_read(int fd,void *b,size_t n){char*p=b;while(n){ssize_t k=read(fd,p,n);if(k<0&&errno==EINTR)continue;if(k<=0){perror("read");exit(1);}p+=k;n-=(size_t)k;}}
static void exact_write(int fd,const void*b,size_t n){const char*p=b;while(n){ssize_t k=write(fd,p,n);if(k<0&&errno==EINTR)continue;if(k<=0){perror("write");exit(1);}p+=k;n-=(size_t)k;}}
__attribute__((noinline)) static unsigned char exchange(unsigned char x){return (unsigned char)(x^1U);}
/* The volatile function pointer and sink keep this call in the timed loop. */
static unsigned char(*volatile callptr)(unsigned char)=exchange;
static double local_trial(void){unsigned char x=0;double a=now_s();for(int i=0;i<N;i++)x=callptr(x);double d=now_s()-a;sink^=x;return d*1e9/N;}
static double pipe_trial(void){int ab[2],ba[2];if(pipe(ab)||pipe(ba)){perror("pipe");exit(1);}pid_t p=fork();if(p<0){perror("fork");exit(1);}if(!p){close(ab[1]);close(ba[0]);unsigned char x;for(int i=0;i<N;i++){exact_read(ab[0],&x,1);x^=1;exact_write(ba[1],&x,1);} _exit(0);}close(ab[0]);close(ba[1]);unsigned char x=0;double a=now_s();for(int i=0;i<N;i++){exact_write(ab[1],&x,1);exact_read(ba[0],&x,1);}double d=now_s()-a;close(ab[1]);close(ba[0]);if(waitpid(p,NULL,0)<0){perror("waitpid");exit(1);}sink^=x;return d*1e9/N;}
static void tcp_server(int lfd,int runs){for(int run=0;run<runs;run++){int c=accept(lfd,NULL,NULL);if(c<0)_exit(2);int one=1;(void)setsockopt(c,IPPROTO_TCP,TCP_NODELAY,&one,sizeof one);unsigned char x;for(int i=0;i<N;i++){exact_read(c,&x,1);x^=1;exact_write(c,&x,1);}close(c);}}
static double tcp_trial(const char *host,int port,int own){int fd=-1;pid_t child=-1;if(own){int l=socket(AF_INET,SOCK_STREAM,0);if(l<0){perror("socket");exit(1);}struct sockaddr_in s={0};s.sin_family=AF_INET;s.sin_addr.s_addr=htonl(INADDR_LOOPBACK);s.sin_port=0;if(bind(l,(struct sockaddr*)&s,sizeof s)||listen(l,1)){perror("bind/listen");exit(1);}socklen_t z=sizeof s;if(getsockname(l,(struct sockaddr*)&s,&z)){perror("getsockname");exit(1);}child=fork();if(child<0){perror("fork");exit(1);}if(!child){tcp_server(l,1);_exit(0);}close(l);fd=socket(AF_INET,SOCK_STREAM,0);host="127.0.0.1";port=ntohs(s.sin_port);}
 else {fd=socket(AF_INET,SOCK_STREAM,0);}
 if(fd<0){perror("socket");exit(1);}int one=1;(void)setsockopt(fd,IPPROTO_TCP,TCP_NODELAY,&one,sizeof one);struct addrinfo hints={0},*res=NULL;hints.ai_family=AF_INET;hints.ai_socktype=SOCK_STREAM;char service[16];snprintf(service,sizeof service,"%d",port);int gr=getaddrinfo(host,service,&hints,&res);if(gr){fprintf(stderr,"getaddrinfo: %s\n",gai_strerror(gr));exit(2);}if(connect(fd,res->ai_addr,res->ai_addrlen)){perror("connect");freeaddrinfo(res);exit(1);}freeaddrinfo(res);unsigned char x=0;double t=now_s();for(int i=0;i<N;i++){exact_write(fd,&x,1);exact_read(fd,&x,1);}double d=now_s()-t;close(fd);if(own&&waitpid(child,NULL,0)<0){perror("waitpid");exit(1);}sink^=x;return d*1e9/N;}
static void sort3(double *v){for(int i=0;i<3;i++)for(int j=i+1;j<3;j++)if(v[i]>v[j]){double x=v[i];v[i]=v[j];v[j]=x;}}
int main(int argc,char **argv){int serve=0,explicit_remote=0,port=0;const char *host="127.0.0.1";for(int i=1;i<argc;i++){if(!strcmp(argv[i],"--serve"))serve=1;else if(!strcmp(argv[i],"--host")&&i+1<argc){host=argv[++i];explicit_remote=1;}else if(!strcmp(argv[i],"--port")&&i+1<argc)port=atoi(argv[++i]);else{fprintf(stderr,"usage: %s [--host IPv4 --port N] | --serve --port N\n",argv[0]);return 2;}}
 if(serve){if(port<1||port>65535){fprintf(stderr,"--serve requires --port 1..65535\n");return 2;}int l=socket(AF_INET,SOCK_STREAM,0);if(l<0){perror("socket");return 1;}struct sockaddr_in a={0};a.sin_family=AF_INET;a.sin_addr.s_addr=htonl(INADDR_ANY);a.sin_port=htons((unsigned short)port);if(bind(l,(struct sockaddr*)&a,sizeof a)||listen(l,1)){perror("bind/listen");return 1;}fprintf(stderr,"ready on port %d; accepting four benchmark connections from one client process\n",port);tcp_server(l,4);close(l);return 0;}
 if(explicit_remote&&(!port||port>65535)){fprintf(stderr,"explicit --host requires --port 1..65535\n");return 2;}if(!explicit_remote&&port){fprintf(stderr,"--port alone is not allowed; explicitly pass --host and --port\n");return 2;}signal(SIGPIPE,SIG_IGN);
 char h[256]="unknown",cpu[256]="unknown",date[64]="unknown";gethostname(h,sizeof h);h[sizeof h-1]=0;FILE*cf=fopen("/proc/cpuinfo","r");if(cf){char line[512];while(fgets(line,sizeof line,cf))if(!strncmp(line,"model name",10)){char*p=strchr(line,':');if(p){snprintf(cpu,sizeof cpu,"%s",p+2);cpu[strcspn(cpu,"\n")]=0;}break;}fclose(cf);}time_t tt=time(NULL);struct tm tm;if(gmtime_r(&tt,&tm))strftime(date,sizeof date,"%Y-%m-%dT%H:%M:%SZ",&tm);printf("# experiment=network\n# host=%s\n# cpu=%s\n# date_utc=%s\n# flags=-std=c11 -O2 -Wall -Wextra\n# loopback_is_not_a_real_network=true\ntrial,method,ns_per_round_trip\n",h,cpu,date);double v[3];(void)local_trial();for(int t=0;t<3;t++){v[t]=local_trial();printf("%d,in_process_function_pointer,%.1f\n",t+1,v[t]);}sort3(v);printf("# median,in_process_function_pointer,%.1f\n",v[1]);(void)pipe_trial();for(int t=0;t<3;t++){v[t]=pipe_trial();printf("%d,two_process_pipes,%.1f\n",t+1,v[t]);}sort3(v);printf("# median,two_process_pipes,%.1f\n",v[1]);(void)tcp_trial(host,port,!explicit_remote);for(int t=0;t<3;t++){v[t]=tcp_trial(host,port,!explicit_remote);printf("%d,%s,%.1f\n",t+1,explicit_remote?"explicit_remote_tcp":"loopback_tcp",v[t]);}sort3(v);printf("# median,%s,%.1f\n",explicit_remote?"explicit_remote_tcp":"loopback_tcp",v[1]);puts("# A second machine adds a distance floor: signals cannot travel faster than light, before routing and queueing delays.");return 0;}
