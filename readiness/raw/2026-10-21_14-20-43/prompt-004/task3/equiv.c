#include <stdio.h>
#include <stdlib.h>
static void median3(double *v){for(int i=0;i<3;i++)for(int j=i+1;j<3;j++)if(v[i]>v[j]){double x=v[i];v[i]=v[j];v[j]=x;}}
int main(void){srand(1);long bad=0;for(int n=0;n<2000000;n++){double w[3],r[3],c[3],a[3],b[3],d[3];for(int k=0;k<3;k++){w[k]=a[k]=rand()%7;r[k]=b[k]=rand()%7;c[k]=d[k]=rand()%7;}
for(int i=0;i<3;i++)for(int j=i+1;j<3;j++){if(w[i]>w[j]){double x=w[i];w[i]=w[j];w[j]=x;}if(r[i]>r[j]){double x=r[i];r[i]=r[j];r[j]=x;}if(c[i]>c[j]){double x=c[i];c[i]=c[j];c[j]=x;}}
median3(a);median3(b);median3(d);for(int k=0;k<3;k++)if(w[k]!=a[k]||r[k]!=b[k]||c[k]!=d[k])bad++;}
printf("mismatches=%ld\n",bad);return bad!=0;}
