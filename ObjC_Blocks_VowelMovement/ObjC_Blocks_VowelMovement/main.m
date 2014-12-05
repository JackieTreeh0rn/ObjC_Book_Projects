//
//  main.m
//  ObjC_Blocks_VowelMovement
//
//  Created by EvilKernel on 12/4/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

/* BLOCKS are basicalled nameless functions. A caret (^) identifies a piece of code as a block */

/* Using BLOCKS as an argument. in this case, we will use the NSArray 'enumerateObjectsUsingBlock:'
 to iterate over an array of strings, remove vowels from each string and store the devowelized
 strings in a new array */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create one array of strings to iterate through
        NSArray *originalStrings = @[@"SauerKraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
        NSLog(@"Original Strings: %@", originalStrings);
        
        // Create array container for devowelized ones
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        // Create array with list of vowels/characters
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        // DECLARE a BLOCK.  Blocks can be stored in a variable
        /* ("void" is return type | "devowelizer" is name of block variable | "id, NSUInteger, BOOL *" are argument types) just like a function!!! */
        /* what is the TYPE of this variable? it is not 'block' type.  Its type is "a block that takes an object, an integer, and a BOOL pointer and returns nothing */
        void (^devowelizer)(id, NSUInteger, BOOL *); // this is the type of block that 'enumerateObjectsUsingBlock:' expects
        
        // Compose the block and assign it to the variable
        devowelizer = ^(id string, NSUInteger i, BOOL *stop){
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            // Iterate over the array of vowels, replacing occurrences of each with an empty string
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            [devowelizedStrings addObject:newString];
            
        }; // End of Block assigment
        
        
    }
    return 0;
}
