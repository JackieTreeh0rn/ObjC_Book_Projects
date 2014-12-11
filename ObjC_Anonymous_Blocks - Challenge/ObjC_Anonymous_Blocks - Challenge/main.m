//
//  main.m
//  ObjC_Anonymous_Blocks - Challenge
//
//  Created by EvilKernel on 12/10/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

/* BLOCKS are basicalled nameless functions. A caret (^) identifies a piece of code as a block */

/* Using BLOCKS as an argument. Many classes have methods that accept blocks (such as to enumerate). In this case, we will use the NSArray 'enumerateObjectsUsingBlock:'
 to iterate over an array of strings, remove vowels from each string and store the devowelized
 strings in a new array */


///--- THIS IS A CHALLENGE BASED ON THE CHAPTER - REMOVING THE VARIABLE ASSIGNMENT AND SENDING THE BLOCK ANONYMOUSLY ---///

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create one array of strings to iterate through
        NSArray *originalStrings = @[@"SauerKraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
        NSLog(@"Original Strings: %@", originalStrings);
        
        // Create array container for devowelized ones
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        // Create array with list of vowels/characters
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        
        // Iterate over the array with an anonymous BLOCK
        [originalStrings enumerateObjectsUsingBlock:
                                                    ^(id string, NSUInteger i, BOOL *stop){
                                                        NSMutableString *newString = [NSMutableString stringWithString:string];
                                                        
                                                        /*NSRange yRange = [string rangeOfString:@"y"
                                                                                       options:NSCaseInsensitiveSearch];
                                                        if (yRange.location != NSNotFound) {
                                                            *stop = YES;
                                                            return;
                                                        }*/
                                                        
                                                        for (NSString *s in vowels) {
                                                            NSRange fullRange = NSMakeRange(0, newString.length);
                                                            [newString replaceOccurrencesOfString:s
                                                                                       withString:@""
                                                                                          options:NSCaseInsensitiveSearch
                                                                                            range:fullRange];
                                                        }
                                                        [devowelizedStrings addObject:newString];
                                                        
                                                                                }];
        
        NSLog(@"Devowelized Strings: %@", devowelizedStrings); // output devowelized array
        
        
    }
    return 0;
}