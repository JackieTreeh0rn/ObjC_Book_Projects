//
//  main.c
//  Numbers
//
//  Created by EvilKernel on 6/15/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> //needed for these functions

int main(int argc, const char * argv[])
{
    // INTEGERS NUMBERS (SHORT, INT, LONG)
    // Playing with different tokens and integer variable types (short, int, long.  Signed and unsigned).
    int x = 255;
    printf("x is %d.\n", x); //%d is integer token
    printf("In octal, x is %o.\n", x); //%o is octal token
    printf("In hexadecimal, x is %x.\n", x); //%x is hex token
    
    // playing with different tokens and integer variable types (short, int, long.  Signed and unsigned).
    unsigned long xx = 255; //unsigned long means positive long integer only
    printf("x is %lu.\n", xx); //%lu is token for long unsigned
    printf("In octal, x is %lo.\n", xx); // and so on
    printf("In hexadecimal, x is %lx.\n", xx); //and so on
    
    // mutiplications are always evaluated before + or - operations
    printf("3 * 3 + 5 * 2 = %d\n", 3 * 3 + 5 * 2);
    
    // divisions - integers divided by another always gives a 3rd integer - rounds off towards "0".  Below would have been 3.66667)
    printf("11 / 3 = %d\n", 11 / 3);
    
    // divisions - “The modulus operator (%) is like /, but it returns the remainder instead of the quotient. Add the modulus operator to get a statement that includes the remainder.
    printf("11 / 3 = %d remainder of %d \n", 11 / 3, 11 % 3);
    
    /* “What if you want to get 3.666667? You convert the int to a float using the cast operator. The cast operator is the type that you want placed in parentheses to the left of the variable you want converted. Cast your denominator as a float before you do the division:”  “floating point division will be done instead of integer division, and you will get 3.666667.”
     */
    printf("11 / 3.0 = %f\n", 11 / (float)3); //cast operator is (float)left of the integer
    
    /* “To get the absolute value of an int, you use a function instead of an operator. The function is abs(). 
     If you want the absolute value of a long, use labs(). Both functions are declared in "stdlib.h:”
     */
    printf("The absolute value of -5 is %d\n", abs(-5));
    
    
    
    // FLOATING POINT NUMBERS (FLOAT, DOUBLE)
    // printf() can also display floating point numbers, most commonly using the tokens %f and %e.  “So %f uses normal decimal notation, and %e uses scientific notation”
    double y = 12345.6789;
    printf("y is %f\n", y);
    printf("y is %e\n", y);
    
    // Notice that %f is currently showing 6 digits after the decimal point. This is often a bit much. Limit it to two digits by modifying the token”
    double z = 12345.6789;
    printf("z is %.2f\n", z);
    printf("z is %.2e\n", z);
    
    return 0;
}

