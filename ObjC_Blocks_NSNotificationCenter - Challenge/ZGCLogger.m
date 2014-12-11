//
//  ZGCLogger.m
//  ObjC_Blocks_NSNotificationCenter - Challenge
//
//  Created by EvilKernel on 12/10/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCLogger.h"

@implementation ZGCLogger


// ------- NOTIFICATIONS METHOD (used for callback)---------
- (void)zoneChange:(NSNotification *)note
{
    NSLog(@"Time zone has been changed to %@", [NSTimeZone systemTimeZone]); //pulling local system timzone for this output
}


@end
