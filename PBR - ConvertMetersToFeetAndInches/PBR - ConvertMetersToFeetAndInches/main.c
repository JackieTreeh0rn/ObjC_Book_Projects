//
//  main.c
//  PBR - ConvertMetersToFeetAndInches
//
//  Created by EvilKernel on 7/2/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <math.h>

// Function to convert meters to feet and inches, usng pass-by-reference
// this function assumes meters is non-negative
void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *inPtr)
{
    // Convert the number of meters into a floating -point number of feet
    double rawfeet = meters * 3.281; // eg: 2.4536
    
    //How many complete feet as an unsigned int?
    unsigned int feet = (unsigned int)floor(rawfeet); //calling math 'floor' function
    
    // Store the number of feet at the supplied address
    printf("Storing %u to the address %p\n", feet, ftPtr);
    *ftPtr = feet;
    
    // Calculate inches
    double fractionalFoot = rawfeet - feet;
    double inches = fractionalFoot * 12.0;
    
    // Store the number of inches at the supplied address
    printf("Storing %.2f to the address %p\n", inches, inPtr);
    *inPtr = inches;
}

// main fucntion
int main(int argc, const char * argv[])
{

    double meters = 3.0;
    unsigned int feet;
    double inches;
    
    // Call function above.  Passing arguments: meters, address of the "feet" variable and address of the "inches" variable
    metersToFeetAndInches(meters, &feet, &inches);
    printf("%.1f meters is equal to %d feet and %.1f inches.\n", meters, feet, inches);
    
    return 0;
}

