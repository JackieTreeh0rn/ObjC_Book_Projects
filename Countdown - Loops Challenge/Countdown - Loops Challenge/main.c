//
//  main.c
//  Countdown - Loops Challenge
//
//  Created by EvilKernel on 6/21/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <objc/objc.h>

int main(int argc, const char * argv[])
{
    
    // counts back from 99-0 by increments of three.  When number divisible by 5 is found, displays message.
    printf("counts back from 99-0 in threes.  When number divisible by 5 is found, displays message.\n");
    int i; //declare int variable to hold value
    for (i = 99; i > -1; i-=3) { // FOR loop. set initial value of i, while it remains greater than -1, process code below, then decrease by three.
        BOOL divbyFive = ((i % 5) == 0); //USING Boolean variable here by choice.  BOOL is a variable TYPE that can be either TRUE or FALSE (holds and IF conditional). Here we are saying divbyFive will hold a TRUE value if remainder of i divided by 5 equals 0 (is # div by 5) and a FALSE value otherwise?
        if (divbyFive) { // IF BOOLEAN variable above found to be TRUE
            printf("%d...found one!\n", i); //Print this output (number found)
        }else{ //si no, sigue contando
            printf("%d...\n", i);
        }
    }
    
    
    return 0;
}
