#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool validate_args(int argc, char **argv)
{
	if (argc != 3) 
	{
		return false;
	}
	double x, y;
	int sscanf_result;
	sscanf_result = sscanf(argv[1], "%f", &x);
	if (sscanf_result == 0) 
	{
		return false;
	}
	sscanf_result = sscanf(argv[2], "%f", &y);
	if (sscanf_result == 0) 
	{
		return false;
	}
	return true;
}

int main(int argc, char **argv)
{
	system ("chcp 1251");
	double x,y;
	if(validate_args(argc, argv))
	{
		x = atof(argv[1]);
		y = atof(argv[2]);
		printf("%f %f", x, y);
	}
	else
	{
		printf("Неверные параметры. Wrong arguments");
		system("pause>nul");
		return 2;
	}
	
	
	
    system("pause>nul");
	return 0;
}