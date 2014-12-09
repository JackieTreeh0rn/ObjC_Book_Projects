//
//  main.m
//  ObjC_Blocks_VowelMovement
//
//  Created by EvilKernel on 12/4/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

/* BLOCKS are basicalled nameless functions. A caret (^) identifies a piece of code as a block */

/* Using BLOCKS as an argument. Many classes have methods that accept blocks (such as to enumerate). In this case, we will use the NSArray 'enumerateObjectsUsingBlock:'
 to iterate over an array of strings, remove vowels from each string and store the devowelized
 strings in a new array */


typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *); // declaring a typedef (this is similar to declaration of the block below into a varible except for that this way you are defining a "type" (which simplies declarations of similar blocks (see below code update)

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
        
        /* void (^devowelizer)(id, NSUInteger, BOOL *); */ // this is the type of block that 'enumerateObjectsUsingBlock:' expects. It has 3 arguments specifically designeed for iterating through an array
        ArrayEnumerationBlock devowelizer;  // using a type instead of a variable declaration (simplies for multiple declarations)
        
        // COMPOSE the BLOCK and assign it to the variable (this block will get executed once per object when passed to the 'enumerateObjectsUsingBlock:' method
        devowelizer = ^(id string, NSUInteger i, BOOL *stop){
            NSMutableString *newString = [NSMutableString stringWithString:string];  // make mutable copy of original string
            
            NSRange yRange = [string rangeOfString:@"y"
                                           options:NSCaseInsensitiveSearch]; // adding this as test to also find lower/upper case "y"s in original strings
            
            // adding a condition for Did it find a "y"?  If so, set the BOOL *stop argument to YES which stops the current iteration (in this case it will stop when it finds "Raygun"
            if (yRange.location != NSNotFound) {  /// disable this conditional to allow interation to go continue (STOP defaults to NO)
                *stop = YES; // prevent further iteration
                return;     // end this iteration
            }
            
            // Iterate over the array of vowels, using it to replace the vowels from the new mutablestring copies of each original string with "empty" strings (hence removing vowels)
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]); // range is needed by the argument, using one that reflects the entire range of the string
                
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            [devowelizedStrings addObject:newString]; // add new (devowelized string) to the Mutable array
        }; // End of Block assigment
        
        // Iterate over the array with the BLOCK
        [originalStrings enumerateObjectsUsingBlock:devowelizer]; // pass the block we composed. it will get executed once per object in the 'originalStrings' array
        NSLog(@"Devowelized Strings: %@", devowelizedStrings); // output devowelized array
        
        
    }
    return 0;
}
