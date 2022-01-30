#include "half.h"
half addhalf( const half a, const half b ) {

  half sum = 0;
if(a<<1==0 && b<<1==0)
{
return 0;
}
if(((a-b)==pow(2,15))||((b-a)==pow(2,15)))
{
return 0;
}
if((a<<1)==0)
{
sum=b;
}
if((b<<1)==0)
{
return a;
}
 int s1,e1,m1,s2,e2,m2,s,e,m;
s1=a>>15;
e1=(a&0x7d00);
e1=e1>>10;
m1=(a&0x03ff)|(0x0400);
s2=b>>15;
e2=(b&0x7d00);
e2=e2>>10;
m2=(b&0x03ff)|(0x0400);
if(s1==s2)
{
s=s1;
if(e1>=e2)
{
e=e1;
m2=m2>>(e1-e2);
e2=e1;
m=m1+m2;
if(m>=(pow(2,11)))
{
e++;
m=(m>>1);
m=m&0x03ff;
}
m=m&0x3ff;
}
else
{
e=e2;
m1=m1>>(e2-e1);
e1=e2;
m=m1+m2;
if(m>=(pow(2,11)))
{
e++;
m=(m>>1);
m=m&0x03ff;
}
m=m&0x3ff;
}
}

if(s1!=s2)
{
if(e1>e2)
{
s=s1;
e=e1;
m2=m2>>(e1-e2);
e2=e1;
m=m1-m2;
while(m<pow(2,10))
{
e--;
m=m<<1;
}
m=m&0x03ff;
}
else if(e1<e2)
{
s=s2;
e=e2;
m1=m1>>(e2-e1);
e1=e2;
m=m2-m1;
while(m<pow(2,10))
{
e--;
m=m<<1;
}
m=m&0x3ff;
}
else
{
if(m1>m2)
{
s=s1;
e=e1;
m=m1-m2;
while(m<pow(2,10))
{
e--;
m=m<<1;
}
m=m&0x3ff;
}
else
{
s=s2;
e=e2;
m=m2-m1;
while(m<pow(2,10))
{
e--;
m=m<<1;
}
m=m&0x3ff;
}
}
}
e=e<<10;
s=s<<15;
sum=s+e+m;

e1=e1>>10;
e2=e2>>10;
if(e1==31||e2==31)
return NAN;





  return sum;
}
