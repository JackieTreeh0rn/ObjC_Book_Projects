//
//  main.c
//  Degrees
//
//  Created by EvilKernel on 6/15/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

// Declaring a global variable.  Use 'static' (ie 'static float' to declare static variable (can be referenced within the file only)
float lastTemperature;

// This is a function that returns a value, in this case, 'fahr'. functions that return a value are defined with variable type
float fahrenheitFromCelsius(float cel)
{
    lastTemperature = cel; //last temp. global variable can reference from any function
    float fahr = cel * 1.8 + 32.0; // convert celsius to fahrenheit
    printf("%f Celsius is %f Fahrenheit\n", cel, fahr);
    return fahr;
}

int main(int argc, const char * argv[])
{
    float freezeInC = 0;
    float freezeinF = fahrenheitFromCelsius(freezeInC);
    printf("Water freezes at %f degrees Fahrenheit.\n", freezeinF);
    printf("The last temperature converted was %f.\n", lastTemperature);
    return EXIT_SUCCESS; // C alias for return 0
}

