//
//  main.c
//  ObjC_BITWISE_Challenge
//
//  Created by EvilKernel on 2/2/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> // For malloc/free
#include <string.h> // for strlen() function

/// CHALLENGE ///
/* write a program that creates an unsigned 64-bit integer such that
 every other bit is turned on (there are two possible resulting numbers
 one is even other is odd - create the odd one and display the number
 RESULT SHOULD BE: 6,148,914,691,236,517,205 */

int main(int argc, const char * argv[]) {

    uint64_t n = 0; // long long int "typedef"
    for (int i = 0; i < 64; i++) {
        n = n << 2; // using BITWISE LEFT-SHIFT operation
        n++;
        printf("number is %lld\n", n); // added printf to loop to see operation in action
    }
    
    printf("number is %lld\n", n);
    

    
    
}
