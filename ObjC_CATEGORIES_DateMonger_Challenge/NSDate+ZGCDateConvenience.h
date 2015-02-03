//
//  NSDate+ZGCDateConvenience.h
//  ObjC_CATEGORIES_DateMonger_Challenge
//
//  Created by EvilKernel on 1/27/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ZGCDateConvenience)

 /* CHALLENGE - a category that takes 3 integers (year, month, day) and returns a new NSDate instance
    initiliazed to midnight on the passed-in day */

+ (NSDate *)zgc_dateByIntYear:(int)yy month:(int)mm day:(int)dd;  // CLASS method
- (NSString *)zgc_dateFormatter; // instance method

@end
