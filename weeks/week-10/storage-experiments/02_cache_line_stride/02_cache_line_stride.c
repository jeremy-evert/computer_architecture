#define _POSIX_C_SOURCE 200809L
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

static volatile uint64_t sink;
static double now_ns(void) { struct timespec t; if (clock_gettime(CLOCK_MONOTONIC,&t)!=0) exit(2); return (double)t.tv_sec*1e9+(double)t.tv_nsec; }
static double med(double a,double b,double c) { if(a>b){double x=a;a=b;b=x;} if(b>c){double x=b;b=c;c=x;} if(a>b)b=a; return b; }
static size_t cache_bytes(void) {
    size_t max=0; char path[256], line[64];
    for(unsigned i=0;i<32;i++) {
        snprintf(path,sizeof path,"/sys/devices/system/cpu/cpu0/cache/index%u/size",i);
        FILE *f=fopen(path,"r"); if(!f) break;
        if(fgets(line,sizeof line,f)) { unsigned long long n=0; char unit=0; if(sscanf(line,"%llu%c",&n,&unit)>=1) { size_t bytes=(size_t)n; if(unit=='K'||unit=='k')bytes*=1024; if(unit=='M'||unit=='m')bytes*=1024*1024; if(bytes>max)max=bytes; } }
        fclose(f);
    }
    return max;
}
static void metadata(void) {
    char host[256]="unknown",cpu[256]="unknown",line[512]; gethostname(host,sizeof host);host[sizeof host-1]='\0';
    FILE *f=fopen("/proc/cpuinfo","r"); if(f){while(fgets(line,sizeof line,f))if(strncmp(line,"model name",10)==0){char*p=strchr(line,':');if(p){p+=2;p[strcspn(p,"\r\n")]='\0';snprintf(cpu,sizeof cpu,"%s",p);}break;}fclose(f);}
    char date[64]="unknown";f=popen("date -u +%Y-%m-%dT%H:%M:%SZ","r");if(f){if(fgets(date,sizeof date,f))date[strcspn(date,"\r\n")]='\0';pclose(f);}
    printf("# experiment=02_cache_line_stride\n# host=%s\n# cpu_model=%s\n# date_utc=%s\n# compiler_flags=-std=c11 -O2 -Wall -Wextra\n",host,cpu,date);
}
int main(void) {
    size_t largest=cache_bytes(), bytes=largest>128u*1024u*1024u?512u*1024u*1024u:256u*1024u*1024u;
    size_t n=bytes/sizeof(uint32_t); uint32_t *a=NULL;
    if(posix_memalign((void**)&a,64,bytes)!=0||!a){fprintf(stderr,"array allocation failed (%zu bytes)\n",bytes);return 2;}
    for(size_t i=0;i<n;i++)a[i]=(uint32_t)(i+1);
    metadata();printf("# array_bytes=%zu\n# largest_cpu0_cache_bytes=%zu\n",bytes,largest);
    puts("stride_elements,stride_bytes,trial,ns_per_access");
    const size_t accesses=100000000; size_t mask=n-1;
    for(size_t stride=1;stride<=512;stride*=2){double v[3];
        size_t warm_idx=0;uint64_t warm_sum=0;
        for(size_t j=0;j<10000;j++){warm_sum+=a[warm_idx];warm_idx=(warm_idx+stride)&mask;}
        sink+=warm_sum;
        for(int t=0;t<3;t++){size_t idx=0;uint64_t sum=0;double s=now_ns();
            /* A volatile sink consumes the loaded values after each timed pass. */
            for(size_t j=0;j<accesses;j++){sum+=a[idx];idx=(idx+stride)&mask;}
            double e=now_ns();sink+=sum;v[t]=(e-s)/(double)accesses;
            printf("%zu,%zu,%d,%.6f\n",stride,stride*sizeof(uint32_t),t+1,v[t]);
        }
        printf("%zu,%zu,median,%.6f\n",stride,stride*sizeof(uint32_t),med(v[0],v[1],v[2]));
    }
    free(a);return sink==0?1:0;
}
