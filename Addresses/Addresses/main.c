//
//  main.c
//  Addresses
//
//  Created by EvilKernel on 6/22/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    // display memory address of variable. Using the  "&" operator and the "%p" token.
    int i = 17;
    printf("\"i\" stores its value at %p\n", &i);
    printf("this function starts at %p\n", main); // display mem. address of function "main".
    
    // storing the memory address in a variable using a pointer type variable , declared with "*".  The new variable named addressOfI is a pointer to an "int" (or where an int can be stored, to be more precise).
    int *addressofI = &i;
    printf("\"i\" stores its value at %p\n", addressofI); //display mem. address of integer variable. this time using the "pointer" variable
    
    // Getting the data at an address.  Pointers are also called "references". Using the pointer to read data at an address is sometimes called "dereferencing" the pointer.
    printf("The \"int\" stored at \"addressofI\" is %d\n", *addressofI);
    
    // You can also use the * operator on the left-hand side of an assigment to store data at that particular address:
    *addressofI = 89;
    printf("Now \"i\" is %d\n", i);
    
    // How many bytes does a data type consume? to find the size of a data type use the sizeof() function with the %zu token. This fucntion returns a value of type size_t.
    printf("An int is %zu bytes\n", sizeof(int));   // if output is 4bytes, prog is running on 32-bit mode. If output is 8bytes, 64-bit mode.
    printf("a float is %zu bytes\n", sizeof(float));
    
    // sizeof() can also take a variable as an argument:
    printf("The pointer is %zu bytes\n", sizeof(addressofI));
    
    
    // Using NULL.  Sometimes you need a pointer variable that can hold an address and you want to store something in it to make it explicit that it isnt set yet.
    float *myPointer;
    // Set pointer to NULL for now, I'll store an address there later
    myPointer = NULL;  //NULL is 0.  This is very handy in "If" statements
    // Has pointer been set?
    if (myPointer) {
        // my pointer is not NULL - do something
        // ();
    } else {
        // my pointer is NULL
        // ();
    }
    
    // Using NULL to indicate no value
    float *measuredGravityPtr = NULL;
    float actualGravity;
    // Some code to set measuredGravity to non NULL
    // ...
    
    //Did we measure gravity?
    if (measuredGravityPtr) {
        actualGravity = *measuredGravityPtr;
    } else {
         actualGravity = estimatedGravity(PlanetRadius);
    }
    
    // OR use ternery "?" operator we learned about instead of IF statement
    // If measuredGravityPtr is NULL, estimate the gravity
    float actualGravity = measuredGravityPtr ? *measuredGravityPtr : estimatedGravity(planetRadius);
    
    return 0;
}

