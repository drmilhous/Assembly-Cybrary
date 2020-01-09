#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char ** argv)
{
	char * array = "TheRightToBearArms@arm.google";
	for(int i = strlen(array); i >=0; i--)
	{
		putchar(array[i]);
	}

}
