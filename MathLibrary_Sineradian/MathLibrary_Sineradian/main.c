//
//  main.c
//  MathLibrary_Sineradian
//
//  Created by EvilKernel on 6/17/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <math.h> //math lib

int main(int argc, const char * argv[])
{
    // Display the sine of 1 radian
    double x = 1;
    double sine = sin(x); //sin() is a function within math.h which calculates a radian
        printf("The sine of \"%.3f\" is \"%.3f\".\n", x, sine);

    

}

