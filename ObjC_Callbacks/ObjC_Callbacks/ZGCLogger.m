//
//  ZGCLogger.m
//  ObjC_Callbacks
//
//  Created by EvilKernel on 11/14/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCLogger.h"

@implementation ZGCLogger

// ----------- TARGET-ACTION METHODS -----------------

- (NSString *)lastTimeString
{
    static NSDateFormatter *dateFormatter = nil; //static variable (sticks around so only one instance of NSDateFormatter is used for the entire process)
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter"); //this technically should only happen once and the global variable sticks around for the entire duration. A static variable, whether declared inside a function or outside, is initialized only once with the value provided on the declaration line.
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    // [self setLastTime:now]; // switching to setting this using actual property to illustrate KVO example in chapter without using accessor (trigger KVO notificaton explicitely)
    [self willChangeValueForKey:@"lastTime"]; // KVO // this before and after check only needed if not monitoring via the accessor method (monitoring explicit variables instead)
    _lastTime = now;
    [self didChangeValueForKey:@"lastTime"]; // KVO // this before and after check only needed if not monitoring via the accessor method (monitoring explicit variables instead)
    NSLog(@"Just set time to %@", self.lastTimeString);
}

// --------------------------------------------------


// ----------HELPER-OBJECT METHODS ------------------

/* called each time a chunk of data arrives */
 - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"received %lu bytes", [data length]);
    
    // create a mutable data if it does not already exist
    if (!_incomingData) {
        _incomingData = [[NSMutableData alloc] init];
    }
    
    [_incomingData appendData:data];
}

/* called when the last chunk has been processed */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:_incomingData
                                             encoding:NSUTF8StringEncoding];
    _incomingData = nil;
    
    NSLog(@"string has %lu characters", [string length]);
    
    // Uncomment to see the entire fetched file
    NSLog(@"The whole string is %@", string);
}

/* Called if the fetch fails */
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection failed: %@", [error localizedDescription]);
}

// just adding this protocol method to see what it returns
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Did get a response from %@", response.URL);
}
// ------------------------------------------------------


// ------- NOTIFICATIONS METHOD -------------------------
- (void)zoneChange:(NSNotification *)note
{
    NSLog(@"Time zone has been changed to %@", [NSTimeZone systemTimeZone]); //pulling local system timzone for this output
}


// KVO // - Class method called by KVO when observing dependent properties, in this case, we are observing @"lastTimeString" in main() which changes when 'lastTime' property changes
+ (NSSet *)keyPathsForValuesAffectingLastTimeString {
    return [NSSet setWithObject:@"lastTime"];
}


@end
