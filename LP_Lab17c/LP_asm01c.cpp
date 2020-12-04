#include <iostream>
#pragma comment (lib, "..\\Debug\\LP_Lab17a.lib")

extern "C"
{
	int __stdcall getmax(int*, int);
	int __stdcall getmin(int*, int);
}

int main()
{
	int arr[10] = { 15, -26, -3, 14, 32, -8, 37, 1, -16, 28 };
	int max = getmax(arr, sizeof(arr) / sizeof(int));
	int min = getmin(arr, sizeof(arr) / sizeof(int));

	std::cout << "c) getmax - getmin = " << max - min << std::endl;
	std::cout << "getmax = " << max << std::endl;
	std::cout << "getmin = " << min << std::endl;
	return 0;
}