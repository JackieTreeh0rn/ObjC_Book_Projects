//
//  main.m
//  ObjC_TimeAfterTime
//
//  Created by EvilKernel on 8/23/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *now = [NSDate date]; //initializes NSDate instance to a pointer named 'now'.  Message sends are [Receiver | Selector].  Receiver is always a pointer.
        NSLog(@"This NSDate object lives at %p", now);
        NSLog(@"The date is %@", now);
        
        double seconds = [now timeIntervalSince1970]; //double, again, is a floating point type with more precision (holds more seconds in this case)
        NSLog(@"It has been %f seconds since 1970", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:100000]; //sending an instance message/method to the original NSDate instance to reflect a future date/time.  This instance method accepts an argument after the ":".  In this case, 100,000 seconds
        NSLog(@"In 100,000 seconds it will be %@", later); // Output
        
        // MULTIPLE ARGUMENTS
        // Want to know day of the month for an NSDate object?  NSDate object does not know this info,  You must ask an NSCalendar object.
        // initiate NSCalendar instance to a pointer (cal). CLASS method 'currentcalendear' will return address of an NSCalendar instance that matches current user calendar setting.
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"My Calendar is %@", [cal calendarIdentifier]); //Get Calendar for user via this instance method. Most Western countries it will be gregorian. but, there is also Hebrew, and Islamic.
        
        // Using method ordinalityOfUnit:inUnit:forDate againts the NSCalendar instance ('cal') and NSDate instance ('now') to get the 'day of the month' for the given date instance. Using 3 arguments.
        unsigned long day  = [cal ordinalityOfUnit:NSDayCalendarUnit // NSDayCalendarUnit is a constant for NSCalendar class which queries Day
                                            inUnit:NSMonthCalendarUnit // NSMonthCalendarUnit is another constant - returns MOnth.  There are other constants to find hours,days,weeks,months,quarters
                                           forDate:now]; // againts the NSDate instance 'now' declared originally
        NSLog(@"This is day %lu of the month", day); //returns unsigned integer (eg. 12, 26)
        
        // Same method as above to get what week of the month the NSDate falls in
        unsigned long week = [cal ordinalityOfUnit:NSWeekCalendarUnit
                                            inUnit:NSMonthCalendarUnit
                                           forDate:now];
        NSLog(@"This is week %lu of the month", week);
        
        
        /// NESTING MESSAGES - EXAMPLE ///  (counterproductive/hard to debug)
        double secondsSince1970 = [[NSDate date] timeIntervalSince1970]; //system handles message sends on the inside first, so date is sent to NSDate class and the result (a pointer to the instance) is sent the instance method/message
        NSLog(@"It has been %f seconds since 1970", secondsSince1970); // same ouput as 'seconds' above.
        
        
        /// ALLOC and INIT ///  (two kinds of message sends that are always used 'nested')
        // 'alloc' is a class method every class has | 'init' is a instance method every class has.
        // 'alloc' method returns a pointer to a new CLASS instance that needs to be initialized. uninitialized instances may exist in memory but they are not ready to receive messages.
        // 'init' method initilizes the instance
        // there is no difference in the two ways. 'init' initializes NSDate object to current date/time - just like 'date' above does. above is more convinient, also called a convinience method.
        NSDate *nowish = [[NSDate alloc] init];
        NSLog(@"This NSDate object lives at %p", nowish);
        NSLog(@"The date is %@", nowish);
        
        /// ID ///
        // used id instead of the class name if you want to declare a pointer to a new object whose class you dont know yet (some kind of objective-C object)
        // notice the * is not used (it is implied)
        // id delegate;
        
        
        /////// C.H.A.L.L.E.N.G.E ///////
        // how many seconds have I been alive?
        NSDate *rightNow = [NSDate date];
        NSString *birthDate = @"1975-01-18 03:00:00 -0400";
        NSDate *birth = [NSDate dateWithString:birthDate];
        double secondsSinceBirth = [rightNow timeIntervalSinceDate:birth];
        NSLog(@"It has been %f seconds since my birth", secondsSinceBirth);
        
        
        // alternatively... one could initilize an instance of NSDateComponents with the birth date
        // and populate an NSCalendar instance (initilized to a gregorian cal)
        // then using an NSDate instance to this day of birth
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1975];
        [comps setMonth:1];
        [comps setDay:18];
        [comps setHour:03];
        [comps setMinute:00];
        [comps setSecond:00];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        
        double secondsSinceMyBirth = [rightNow timeIntervalSinceDate:dateOfBirth];
        NSLog(@"It has been %f seconds since my birth", secondsSinceMyBirth);
        
        
        
                                    
    
        // NOTES ON CASING //
        /*
         !!!Objective C is Case Sensitive!!!
         Variable names that point to instances use "camel case" eg. now, weightLifter, myCurrentLocation
         Method names also use camel case eg. date, bodyMassIndex, timeIntervalSince1970
         Class names are capitalized at the beginning then use camel casing as well eg. NSDate, Person, CLLocation, NSMutableArray (typically prefixed with
         framework name to avoid confusion between similar classes also tels you the framework. eg NS is short for NeXTSTEP, the original platform for foundation.
         Many apple created types an constants are also capilized eg. NSInteger (not a class, an integer type),  NSOKButton (a constant that equals 1)
         */
        
        
        // Bogus message-sends to see error messages //
        /*
        double testSeconds = [NSDate timeintervalsince1970]; sending an instance selector to a CLASS
        NSDate *testNow = [now date]; //CLASS selector being sent to instance. will complain that 'date' selector/method has no CLASS existent.
        */

        

    }
    return 0;
}

