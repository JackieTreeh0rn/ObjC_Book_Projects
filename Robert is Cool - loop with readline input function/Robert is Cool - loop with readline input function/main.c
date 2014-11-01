//
//  main.c
//  Robert is Cool - loop with readline input function
//
//  Created by EvilKernel on 6/21/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>

#import <readline/readline.h> // add this library which has the readline function.  Must add libreadline.dylib under "Build Phases" tab for project.
#import <stdio.h>

int main(int argc, const char * argv[])
{
    printf("Who is cool? ");
    const char *name = readline(NULL); // declaring char tyoe variable to hold value of user input - using readline() function
    printf("%s is cool!\n\n", name); // print output
    
    
    return 0;
}

