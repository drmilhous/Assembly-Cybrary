#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char * allocate();
int main(int argc, char ** argv)
{
	char * array = "HereWeGo@gmail.com";
	if(argc > 1)
	{
		array = allocate();
		int j = strlen(array) -1;
		int ok = 0;
		for(int i = 0; i < strlen(argv[1]); i++,j--)
		{
			if(argv[1][i] == array[j])
			{
				ok ++;
			}
		}
		if(ok == strlen(array) )
		{
			printf("Perfect");
		}	
	
	}	
}

char * allocate()
{
	char * temp = malloc(100);
	strcpy(temp, "elgoog.mra@smrAraeBoTthgiRehT");

	return temp;
}

