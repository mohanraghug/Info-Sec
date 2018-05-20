#include<stdio.h>
void swap(int* a,int* b)
{
  int temp=*a;
  *a=*b;
  *b=temp;
}
int partition(int a[],int p,int r)
{
  int x=a[r];
  int i=p-1;
  int j;
  for(j=p;j<r;j++)
  {
    if(a[j]<=x)
    {
      i=i+1;
      swap(&a[i],&a[j]);
    }
  }
  swap(&a[i+1],&a[r]);
  return i+1;
}
void quicksort(int a[],int p,int r)
{
  if(p>=r) return;
  int q;
  q=partition(a,p,r);
  quicksort(a,p,q-1);
  quicksort(a,q+1,r);
}
int main()
{
  int a[]={10,8,7,5,4,9,2,1,3,6};
  quicksort(a,0,9);
  int i;
  for(i=0;i<10;i++)
  {
    printf("%d",a[i]);
  }
  return 0;
}
