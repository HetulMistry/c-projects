# About

Some basic intermediate level C language programs, optimized using gcc profiling tools.

# Compatibility

[Client-Server Communication](https://github.com/HetulMistry/c-projects/tree/main/Cient%20Server%20Communication "Application Git Repo") Application need to be run on UNIX based systems such as linux.

To use other applications on linux, remove `getch();` function and remove `#include <conio.h>` library from the inclusions as .

`conio.h` is a header file that is commonly used in `MS-DOS` and `Windows` environments for console input and output functions. Under Linux, `getch()` is declared under `curses.h` and defined with its corresponding `ncurses` library.