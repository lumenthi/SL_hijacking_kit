#define _GNU_SOURCE
#include <dlfcn.h>

#define write old_write
#define free old_free

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#undef write
#undef free

size_t write(int fd, const void *buf, size_t count) {
	printf("write() invoqued\n");
	static void *(*func)();
	func = (void *(*)())dlsym(RTLD_NEXT, "write");
	return (size_t)func(fd, buf, count);
}

void free(void *ptr) {
	printf("free() invoqued, denying it\n");
	// static void *(*func)();
	// func = (void *(*)())dlsym(RTLD_NEXT, "free");
	return ;
}
