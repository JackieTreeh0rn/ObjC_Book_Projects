//
//  main.c
//  PBR - Pass-By-Reference
//
//  Created by EvilKernel on 7/1/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <math.h>


int main(int argc, const char * argv[])


{
    // pass by reference examples
    
    double pi = 3.14;
    double integerPart;
    double fractionPart;
    
    // Pass the address of integerPart as an argument
    fractionPart = modf(pi, &integerPart); //modf is a built-in math function which takes a fraction/decimal value (first argument) and passes the integer part to an address (second arg)
    
    // Find the value stored in integerPart
    printf("integerPart = %.0f, fractionPart = %.2f\n", integerPart, fractionPart);
    
    return 0;
    
    
    
}



