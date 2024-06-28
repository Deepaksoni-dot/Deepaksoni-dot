#include<stdio.h>
#include<stdlib.h>
int main(){
    int *a,sum=0;
    a=(int*)calloc(5,sizeof(int));
    printf("Enter the numbers/n");
    for(int i=0;i<5;i++)
    {
        scanf("%d",a+i);
        sum+=*(a+i);
    }
    printf("sum is %d",sum);
    free(a);
    return 0;
}