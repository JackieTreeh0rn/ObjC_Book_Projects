//
//  main.c
//  Conditional-ternary-Operator_Challenge
//
//  Created by EvilKernel on 3/1/13.
//  Copyright (c) 2013 EvilKernel. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int i = 20;
    int j  = 25;
    int k = ( i > j ) ? 10 : 5; //this is a ternery operator (?).  the syntax before the ? is the IF statement.  Right after the "?" is TRUE.  After the ":" is FALSE.
    
    if ( 5 < j - k ) {//First Expression
        printf("The first expression is true.\n");
    } else if ( j > i ) { // second expression
        printf("The second expression is true.\n");
    }else{
        printf("Neither expression is true.\n");
    }
    
    
}

