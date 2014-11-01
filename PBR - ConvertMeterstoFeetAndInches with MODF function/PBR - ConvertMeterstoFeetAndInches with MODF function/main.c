//
//  main.c
//  PBR - ConvertMeterstoFeetAndInches with MODF function
//
//  Created by EvilKernel on 7/6/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <math.h>

// Function to convert meters to feet and inches, usng pass-by-reference
// this function assumes meters is non-negative
void metersToFeetAndInches(double meters, double *ftPtr, double *inPtr)
{
    // Convert the number of meters into a floating -point number of feet
    double rawfeet = meters * 3.281; // eg: 2.4536
    
    //How many complete feet as an unsigned int?
    double feet;
    double inches = modf(rawfeet, &feet);
    
    // Store the number of inches at the supplied address
    printf("Storing %.2f to the address %p\n", inches, inPtr);
    *inPtr = inches;
    
    // Store the number of inches at the supplied address
    printf("Storing %.2f to the address %p\n", feet, ftPtr);
    *ftPtr = feet;
}

// main fucntion
int main(int argc, const char * argv[])
{
    
    double meters = 3.0;
    double feet;
    double inches;
    
    // Call function above.  Passing arguments: meters, address of the "feet" variable and address of the "inches" variable
    metersToFeetAndInches(meters, &feet, &inches);
    printf("%.1f meters is equal to %.0f feet and %.0f inches.\n", meters, feet, inches);
    
    return 0;
}

