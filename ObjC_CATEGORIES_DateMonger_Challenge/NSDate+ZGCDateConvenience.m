//
//  NSDate+ZGCDateConvenience.m
//  ObjC_CATEGORIES_DateMonger_Challenge
//
//  Created by EvilKernel on 1/27/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "NSDate+ZGCDateConvenience.h"

@implementation NSDate (ZGCDateConvenience)

+ (NSDate *)zgc_dateByIntYear:(int)yy month:(int)mm day:(int)dd {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.year = yy;
    comps.month = mm;
    comps.day = dd;
    comps.hour = 00;
    comps.minute = 00;
    comps.second = 00;
    comps.timeZone = [NSTimeZone localTimeZone];
    
    return [cal dateFromComponents:comps];
    
}

- (NSString *)zgc_dateFormatter {
    NSString *yourDate = [NSDateFormatter localizedStringFromDate:self
                                                        dateStyle:NSDateFormatterFullStyle
                                                        timeStyle:NSDateFormatterFullStyle];
    
    return yourDate;
}

@end
