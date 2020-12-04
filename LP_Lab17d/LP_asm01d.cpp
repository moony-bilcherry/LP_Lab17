#include<iostream>

extern "C"
{
	int getmax(int* mas, int size)
	{
		int max = mas[0];
		for (int i = 1; i < size; i++)
		{
			if (mas[i] > max) max = mas[i];
		}
		return max;
	}

	int getmin(int* mas, int size)
	{
		int min = mas[0];
		for (int i = 1; i < size; i++)
		{
			if (mas[i] < min) min = mas[i];
		}
		return min;
	}
}