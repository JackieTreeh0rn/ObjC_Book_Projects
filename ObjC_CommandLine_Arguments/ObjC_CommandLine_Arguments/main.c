//
//  main.c
//  ObjC_CommandLine_Arguments
//
//  Created by EvilKernel on 2/12/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> // for atoi()

int main(int argc, const char * argv[]) {  // the main function has two arguments argv is an array of C strings where command line arguments are store, each argument becomes a C string and gets pacled into argv.  The first argument argc is the number of strings in argv.
    // insert code here...
    
    /*
    for (int i = 0; i < argc; i++) {
        printf("arg %d = %s\n", i, argv[i]); // issue "$> program Terrific 3" on cmdline. Surprise! the first item in argv is not the first one supplied, but the path to the executable
    } */
    
    // Modified to orint out the actual arguments requested/supplied instead (ie. $>./app-name Terrifc 3)
    // atoi() funtion gives you integer off of ASCII
    
    if (argc != 3) { // always good to check desired argument count first
        fprintf(stderr, "Usage: Affirmation <adjetive> <number>\n");
        return 1;
    }
    
    int count = atoi(argv[2]); // count is feeding off of argument #2 (number "4" in this case)
    for (int j = 0; j < count; j++) {
        
        printf("You are %s\n", argv[1]); // array points to argument #1 ("Awesome!" in this case)
    }
    
    // pasing arguments to xcode to run like it was commandline via Product-->Scheme-->arguemtns.
    return 0;
}