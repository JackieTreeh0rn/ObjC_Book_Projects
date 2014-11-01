//
//  main.c
//  BMI_Calculator_with_Struct_Variables
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
// using a typedef.  A typedef defines an alias for a type delcration and allows you to use it more like the usual data types.
typedef struct {
    float heightMeters;
    int weightInKilos;
} Person;

// Function that accepts a Person as a parameter and calculates BMI (persons weight divided by square of height)
float bodyMassIndex(Person p)
{
    return p.weightInKilos / (p.heightMeters * p.heightMeters);
}


int main(int argc, const char * argv[])
{
    Person Mikey;
    Mikey.heightMeters = 1.7;
    Mikey.weightInKilos = 96;
    
    Person Aaron;
    Aaron.heightMeters = 1.97;
    Aaron.weightInKilos = 84;
    
    float bmi; //create variable bmi to hold return value of bodyMassIndex()
    bmi = bodyMassIndex(Mikey);
    printf("Mikey has a BMI of %.2f\n", bmi);
    
    bmi = bodyMassIndex(Aaron);
    printf("Aaron has a BMI of %.2f\n", bmi);
    

    return 0;
}
