///// Print Pascal Triangle

/***
#include <stdio.h>
#include <conio.h>
*/
double a = 1.223E-23

int main()
{
	int i, j, t, n;
	printf("Enter an integer n:" );
	scanf("%d",&n);
	for(i=0; i<=n; i++)
	{
		for(j=0; j<37-3*i; j++)		
			printf(" "); 
		j = 0;	
		while(j<=i)
		{
			if(j==0)
				t = 1; 
			else
				t = t*(i-j+1)/j; 
			printf("%6d", t);	
			j++;
		}
		printf("\n");
	}
	return 0;
}