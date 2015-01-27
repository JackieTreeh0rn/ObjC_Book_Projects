//
//  NSString+ZGCVowelCounting.m
//  ObjC_CATEGORIES_VowelCounter
//
//  Created by EvilKernel on 1/27/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "NSString+ZGCVowelCounting.h"

@implementation NSString (ZGCVowelCounting)

- (int)zgc_vowelCount {  // we are adding this category method which counts vowel on a string
    
    NSCharacterSet *charset = [NSCharacterSet characterSetWithCharactersInString:@"aeiouyAEIOUY"]; // build characterset object to be the vowels
    NSUInteger count = [self length]; // count to hold length of the receiver/supplied to string to evaluate
    int sum = 0; // initiate sum count to 0
    for (int i = 0; i < count; i++) { // for-loop, runs for each character on the receiving string, per the count.
        unichar c = [self characterAtIndex:i]; // house the individual character from the receiving string in a variable
        if ([charset characterIsMember:c]) { // if given character in string matches a character in the character set (vowels), this BOOL returns yes.
            sum++; // sum value is incremented by one
        }
    }
    return sum; //return the total number of character matches.
    
    
}

@end
