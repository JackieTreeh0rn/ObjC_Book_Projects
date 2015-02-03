//
//  main.m
//  ObjC_CATEGORIES_VowelCounter
//
//  Created by EvilKernel on 1/27/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+ZGCVowelCounting.h"


/* Categories allow you to add methods to any existing class. For exmaple, apple does
 not share source code for the NSString class but we can use a category ti add new
 methods */

/* Only this program has this category.  If we want this method in another program we must
 add the category files to the project */

/* ONLY use categories to ADD functionality to existing classes. Use subclassing to replace
 functionality */


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *string = @"Hello, World!";
        NSLog(@"%@ has %d vowels", string, [string zgc_vowelCount]);
        
    }
    return 0;
}
