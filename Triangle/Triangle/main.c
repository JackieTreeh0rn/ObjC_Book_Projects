//
//  main.c
//  Triangle
//
//  Created by EvilKernel on 6/15/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>

// This function returns a float type value.
float remainingAngle(float A, float B) //variables passed as args to function must match data types
{
    float thirdangle = 180 - (A + B); //calculate 3rd angle of a triangle
    return thirdangle;
}


int main(int argc, const char * argv[])
{
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA, angleB); //variable can also equal a function value
    printf("The third angle is %.2f\n", angleC); //.2 next to a float type token means two decimals
    return 0;
    
}

