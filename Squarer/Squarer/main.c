//
//  main.c
//  Squarer
//
//  Created by EvilKernel on 6/15/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>

// Declaring a global variable.  Use 'static' (ie 'static float' to declare static variable (can be referenced within the file only).
int lastinteger;

// Function that calculates square of an integer.
void squareof(int integer)
{
    lastinteger = integer; //value for global variable
    int square = integer * integer; // formula
    char *output = "\"%d\" squared is \"%d\".\n"; //variable of type char (declared as 'char *variablename
    printf(output, integer, square); //output of function
}

int main(int argc, const char * argv[])
{
    // Calculate square of integer
    squareof(5); //invoke function
    printf("last integer used was \"%d\"\n", lastinteger); //log global variable
    return 0;
    
}