#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
int main()
{
	uint8_t a = -1;
	char b  = a;
	int8_t b_1  = 7;
	uint16_t c = -1;
	int16_t d = -1;
	short e = 0xFEED;
	c = a;
	c = b;
	c = b_1;
	d = a;
	d = b;
	return 0;
}

