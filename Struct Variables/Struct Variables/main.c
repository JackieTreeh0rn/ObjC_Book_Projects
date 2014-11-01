//
//  main.c
//  Struct Variables
//
//  Created by EvilKernel on 7/6/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>


/* 
            **** STRUCTS VARIABLES ***
 sometimes you need a variable to hold several related chuncks of data
 each chunck of data is known as the member of the struct.
 */

// Declare a struct variable named Person
struct Person {
    float heightMeters; //member of struct
    int weightInKilos; //member of struct
};


int main(int argc, const char * argv[])
{
    struct Person Mikey; //populate struct members
    Mikey.heightMeters = 1.7;
    Mikey.weightInKilos = 96;
    
    struct Person Aaron; //populate struct members
    Aaron.heightMeters = 1.97;
    Aaron.weightInKilos = 84;
    
    // Notice that members of the struct are acessed via period/dot (.)
    printf("Mikey is %.2f meters tall\n", Mikey.heightMeters);
    printf("Mikey Weighs %d kilograms\n", Mikey.weightInKilos);
    printf("Aaron is %.2f meters tall\n", Aaron.heightMeters);
    printf("Aaron Weighs %d kilograms\n", Aaron.weightInKilos);
    
    
}
