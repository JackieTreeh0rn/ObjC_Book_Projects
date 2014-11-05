//
//  main.m
//  ObjC_Constants
//
//  Created by EvilKernel on 11/1/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\u03c0 is %f", M_PI); // example of constant π (Pi) #define constant
        NSLog(@"%d is larger...", MAX(10, 12)); // example of "#define" constant (used as macro - ie. work as a function)
        
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:@"currency"]; // global variables are always prefered.  NSLocaleCurrencyCode is a global variable (prefered to using @"currency")
        NSLog(@"Money is %@", currency);
        
        
        
        
        
    }
    return 0;
}
