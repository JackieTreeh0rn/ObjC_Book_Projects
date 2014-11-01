//
//  main.c
//  ClassCertificates
//
//  Created by EvilKernel on 6/15/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>

// Using Functions.  Functions hold code, typically repetetive or resusable-type code.  They represent the building blocks of programming. Functions that start with 'void' return no specific values, just process code.
// New function for congratulating students. Prints text to be used for certificates.
void congratulateStudent(char *student, char *course, int numDays) //arguments are variables passed to the function.  in this case it expects 2 string variables of the 'char' type and one integer value 'int' type.
{
    printf("%s has done as much %s Programming as I could fit into %d days.\n", student, course, numDays);  //printf function in this case is what this function will use.  the '$s' is a token of the 'string' type.
}


int main(int argc, const char * argv[])
{
    congratulateStudent("Kate", "Cocoa", 5); //call function's frame into the main() stack by calling its name and passing arguments of the same data type as requested by the function.
    sleep(2);  // wait function.  in this case, wait 2 seconds between outputs.
    congratulateStudent("Bo", "Objective-C", 2);
    sleep(2);
    congratulateStudent("Mike", "Python", 5);
    sleep(2);
    congratulateStudent("Liz", "iOS", 5);
    
    return 0;
}

