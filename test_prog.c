#include <unistd.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	write(1, "c", 1);
	free((void*)0x01);
	return 0;
}
