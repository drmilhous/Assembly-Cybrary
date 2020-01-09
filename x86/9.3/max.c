#include <stdio.h>
#include <stdlib.h>


int max3(int a, int b, int c)
{
	int result = 0;
	if(a > b)
	{
		result = a;
	}
	else 
	{		
		result =b;
	}		
	
	if (c > result)
	{
		result = c;
	}
	return result;
}

int main()
{
	int x, y, z;
	scanf("%d %d %d",&x,&y,&z);
	int r = max3(x,y,z);
	printf("The max is %d", r);
	
}

