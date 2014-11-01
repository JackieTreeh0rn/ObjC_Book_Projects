//
//  main.c
//  Countdown - Loop Challenge - with readline and atoi input functions
//
//  Created by EvilKernel on 6/22/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>
#include <objc/objc.h>
#include <stdlib.h> //needed for atoi function

#import <readline/readline.h> // add this library which has the readline function.  Must add libreadline.dylib under "Build Phases" tab for project.
#import <stdio.h>
int main(int argc, const char * argv[])
{
    // counts back from 99-0 in increments of 3.  When number divisible by 5 is found, displays message.
    printf("counts back from 99-0.  When number divisible by 5 is found, displays message.\n\n");
    printf("At what bumber should I start counting? \n\n");
    const char *input = readline(NULL);  // readline input
    int i; // declare integer variable to hold starting number
    for (i = atoi(input); i > -1; i-=3) { //atoi() function is a "ascii-to-integer" function used to convert the # string from user input to an integer
        BOOL divbyFive = ((i % 5) == 0); //Boolean variable. is # divisible by 5?
        if (divbyFive) {
            printf("%d...found one!\n", i); //if so this gets displayed
        }else{
            printf("%d...\n", i);
        }
    }
    
    
    return 0;
}

