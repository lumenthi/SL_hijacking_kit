# LD_PRELOAD Hijacking kit
This is the repository i use when i need to hijack a function in a dynamically-linked binary, so i don't have to rewrite this everytime.

# Usage
#### Source
Change the source code in hook.c and replace functions by the ones you have to hook then make them do whatever is needed 
#### Compilation
###### Makefile variables
* *Architecture* is used to define the format (32-bit or 64-bit) of the library, make it match with the one used by the vulnerable binary
* *Target* is the vulnerable executable file path, change it to the vulnerable binary path
###### Makefile rules
* *Make* will compile the library, now export LD_PRELOAD and run the vulnerable binary
* *Make run* will compile the library and execute $(TARGET) binary under the corrupted environment
* *Make test* will compile the test binary test_prog.c used for example
* *Make fclean*
* *Make re*
