//
//  main.c
//  ObjC_C-Strings
//
//  Created by EvilKernel on 2/3/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> // For malloc/free
#include <string.h> // for strlen() function


/// C Strings ///
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
    printf("\n\n"); // padding spaces
    
    /* You may be wondering “Hey, a byte can hold any one of 256 numbers (2 raised to the 8th power). 
     You just printed out 94 characters. What happened to the rest?” Well, ASCII was written to drive 
     old teletype-style terminals that printed to paper instead of to a screen, so characters 1 - 31 in 
     ASCII are unprintable control codes. For example, the number 7 in ASCII makes the terminal bell ring. 
     Number 32 is the space character. Number 127 is the delete – it causes the previous character to disappear. 
     What about characters 128 – 255? ASCII only uses 7 bits. 
     There is no ASCII character for the number 128. Nor is there an ASCII character for the number 0.
        
    You can also use ASCII characters as literals in code. Just put them inside 'single' quotes */
    char c = '!'; // the character "!"
    while (c <= '~') { // the character "~"
        printf("%x (decimal %d) is %c\n", c, c, c);
        c++;
    }
    
    printf("\n\n"); // padding spaces
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

/// CHAR * ///
/* a C string is just a bunch of chracters right next to each other in memory. The string ends when
the character 0x00 is ecountered. Functions that take C strings expect the address of the first character.  
strlen() is a function that will count the number of chracters in a string.  */
    
    // Get pointer to 5 bytes of memory on the heap
    /* start is a char *. A char is 1 byte so start + 1 is a pointer one byte further in mem. + 2 is two bytes further and so on... */
    char *start = malloc(5);
    // Put 'L' in the first byte
    *start = 'L';
    // Put 'o' in the second byte
    *(start + 1) = 'o';
    // Put 'v' in the third byte
    *(start + 2) = 'v';
    // Put 'e' in the fourth byte
    *(start + 3) = 'e';
    // Put 'zero' in the fifth byte
    *(start + 4) = '\0';
    // print out the string and its lenght
    printf("%s has %zu characters\n", start, strlen(start));
    // Print out the third character
    printf("The third letter is %c\n\n", *(start + 2));
    // Free the memory so that it can be reused
    free(start);
    start = NULL; // sets pointer itself to null
    
    /* This adding to a pointer and dereferencing the result is so common that there is a shorthand for it: 
     start[2] is equivalent to *(start+2) */
    char *Start = malloc(5);
    // Put 'L' in the first byte
    Start[0] = 'L';
    // Put 'o' in the second byte
    Start[1] = 'o';
    // Put 'v' in the third byte
    Start[2] = 'v';
    // Put 'e' in the fourth byte
    Start[3] = 'e';
    // Put 'zero' in the fifth byte
    Start[4] = '\0';
    // print out the string and its lenght
    printf("%s has %zu characters\n", Start, strlen(Start));
    // Print out the third character
    printf("The third letter is %c\n\n", Start[2]);
    // Free the memory so that it can be reused
    free(start);
    start = NULL; // sets pointer itself to null
    
    /* This also works with any data type. For example, I can make a list of my favorite 3 floating
     point numbers and print them out */
    // Claim a chunck of memory big enough to hold three floats
    /* favorites in this case is a 'float *'.  A float is 4 bytes. Thus, favorites + 1 is 4 bytes further in memory than favorites and so on*/
    float *favorites = malloc(3 * sizeof(float));
    // Push values int the locations in that buffer
    favorites[0] = 3.14158;
    favorites[1] = 2.71828;
    favorites[2] = 1.41421;
    // Print out each number on the list
    for (int i = 0; i < 3; i++) {
        printf("%.4f is favorite %d\n", favorites[i], i);
    }
    // Free the memory so that it can be reused
    free(favorites);
    favorites = NULL;  // sets pointer itself to null
    
    printf("\n"); // padding spaces
    
    
/// STRING LITERALS ///
/* if dealing with C strings a lot, malloc-ing the memory and stuffing the characters in one
 by one would be a real pain.  Instead, you can create a pointer to a string of characters 
 (terminated with the 'zero' character by putting the string in quotes. */
    char *Ztart = "Love"; // no need to malloc/free up memory either.  it is a constant appearing in mem. only once.
    printf("%s has %zu characters\n", Ztart, strlen(Ztart));
    printf("The third letter is %c\n\n", Ztart[2]);
    /*/ But, you also cannot add (ie Ztart + 1 = 'y').  use 'const char *' to have compiler warn you
    about writing to constant parts of memory */
    
/// CONVERTING to and from NSString ///
/* If using C strings in ObjC you will need to know how to make an NSString
 from a C string and vice-versa.  NSString has a method */
    // NSString from C-string
    char *greeting = "Hello!";
    NSString *x = [NSString stringWithCString:greeting encoding:NSUTF8StringEncoding];
    
    // C-String from NSString - trickier 'cause NSString can handle some characters certain encoding cannot. check first like so
    /* note: you do not own the resulting C-string; the system will eventually free it for you, you are guaranteed that it will
     live at last as long as the current autorelease pool.  If you are going to need the C string to live for a long time, put it into a buffer you have created with malloc() */
    NSString *greeting = "Hello!";
    char *x = NULL; // not buffered variable, like above w/malloc()
    if ([greeting canBeConvertedToEncoding:NSUTF8StringEncoding]) {
        x = [greeting cStringUsingEncoding:NSUTF8StringEncoding];
    }
    
    
    
    
    
    return 0;
}
