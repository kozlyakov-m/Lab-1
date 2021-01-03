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
	

	if(validate_args(argc, argv))
	{
		printf("Success");
	}
	else
	{
		printf("Failure");
	}
    system("pause>nul");
	return 0;
}