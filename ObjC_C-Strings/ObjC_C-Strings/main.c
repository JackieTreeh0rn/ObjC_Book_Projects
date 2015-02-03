//
//  main.c
//  ObjC_C-Strings
//
//  Created by EvilKernel on 2/3/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#include <stdio.h>

// C Strings //
/* while in objective C you would use NString whenever possible, there are cases in which
 C strings are sometimes necessary, like when acessing a C library (ie. thre is a library
 of C funtions that lets your program talk to a PostgreSQL database server - the functions in
 that library use C strings */

int main(int argc, const char * argv[]) {
    /* bytes can be treated as numbers as we know but can also be treated as characters.
      ASCII string encoding for instance, defines a different character for each byte (ie. 0x4b is
      the character for "K" */
    
    // Listing characters in ASCII //
    char x = 0x21; // the character "!"
    while (x <= 0x7e) { // the character "~"
        printf("%x (decimal %d) is %c\n", x, x, x);
        x++;
    }
    printf("\n");
    
    /* You may be wondering “Hey, a byte can hold any one of 256 numbers (2 raised to the 8th power). 
     You just printed out 94 characters. What happened to the rest?” Well, ASCII was written to drive 
     old teletype-style terminals that printed to paper instead of to a screen, so characters 1 - 31 in 
     ASCII are unprintable control codes. For example, the number 7 in ASCII makes the terminal bell ring. 
     Number 32 is the space character. Number 127 is the delete – it causes the previous character to disappear. 
     What about characters 128 – 255? ASCII only uses 7 bits. 
     There is no ASCII character for the number 128. Nor is there an ASCII character for the number 0.
        
    You can also use ASCII characters as literals in code. Just put them inside single quotes*/
    char c = '!'; // the character "!"
    while (c <= '~') { // the character "~"
        printf("%x (decimal %d) is %c\n", c, c, c);
        c++;
    }
    
    /* The non-printable characters can be expressed using escape sequences that start with \.
     You have already used \n for the newline character. Here are some other common ones: */
/*
    \n	new line
    \t	tab
    \'	single-quote
    \"	double-quote
    \0	null byte (0x00)
    \\	backslash”
*/
    
    return 0;
}
