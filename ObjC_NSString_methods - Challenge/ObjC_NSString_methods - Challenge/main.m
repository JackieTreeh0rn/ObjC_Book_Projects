//
//  main.m
//  ObjC_NSString_methods - Challenge
//
//  Created by EvilKernel on 9/7/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //Use rangeOfString: method to find a substring but in a non case-sensitive search (rangeOfString: is case sensitive by default. Also, find a method to output the string found within the range.
        
        
        NSString *listOfNames = @"RoBeRt, Mitchel, scharon"; // define a string with some names/values
        NSString *name = @"robert"; // define name to search for
        NSRange match = [listOfNames rangeOfString:name // perform search for this substring - NSRange allows for String seatch matching via criteria. NSRange returns value and location.
                                           options:NSCaseInsensitiveSearch]; // make it non-case sensitive search
                         
    
        BOOL isNoMatch = match.location == NSNotFound; // using a boolean variable here for no match found
        if (isNoMatch) {
            NSLog(@"No match found for %@", name); // log no name found for search
        }else{
            NSString *nameFound = [listOfNames substringWithRange:match]; // method to return string from receiver from the range
            NSLog(@"The following match has been found %@", nameFound); //logging the actual string found.
        }
        
        
    
        
    }
    
        
        
        
        
        
        
    
    return 0;
}

