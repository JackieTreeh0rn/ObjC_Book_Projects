//
//  main.c
//  ObjC_C-Strings_CHALLENGE
//
//  Created by EvilKernel on 2/3/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#include <stdio.h>
#include <string.h> // for strlen()

// function that counts the space characters (ASCII 0x20) in a C-String
int spaceCount(const char *string) {
    char space = 0x20; // define charc. we are interested in
    uint16_t len = strlen(string); // count # of chars on supplied string
    int sum = 0;
    for (int i = 0; i < len; i++) {
        if (string[i] == space) { // using shorthand for indentifying each byte (char) in string via loop
            sum++;
        }
    }
    return sum; //return count
}


int main(int argc, const char * argv[]) {
    // Counting Space Characters in String
    const char *sentence = "He was not in the cab at the time!";
    printf("There are %d spaces in the sentence: %s\n", spaceCount(sentence), sentence);
    return 0;
}
