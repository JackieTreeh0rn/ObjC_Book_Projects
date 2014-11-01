//
//  main.m
//  ObjC_NSString
//
//  Created by EvilKernel on 9/6/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSDate *now= [NSDate date];
        
        NSString *lament= @"Why me!?"; //This is how you declare a literal string
        
        NSString *slogan = @"I \u2661 New York"; //NString uses unicode. you can specificy non-ASCII unicode characters using the characters hexadecimal
        NSLog(@"%@", slogan);
        
        NSString *dateString = [NSString stringWithFormat:@"The date is %@", now]; //a dynamic string using stringWithFormat method
        NSLog(@"%@", dateString);
        
        // Using Length method to count # of chars using the 'length' instance method
        NSUInteger charcount = [dateString length];
        NSLog(@"the \"date string\" is %lu characters long", charcount);
        
        //Comparing strings using 'isEqualToString:' method.  it returns a BOOL reporting whether two strings are equal
        if ([lament isEqualToString:slogan]) {
            NSLog(@"%@ and %@ are equal", lament, slogan);
            
        }
        //or declare a BOOL variable to use later
        BOOL isEqual = [lament isEqualToString:slogan];
        if (isEqual) {
            NSLog(@"%@ and %@ are equal", lament, slogan);
        }
        
        // Getting an upppercase version using this method
        NSString *angryText = @"That makes me so mad!";
        NSString *reallyAngryText = [angryText uppercaseString];
        NSLog(@"%@", reallyAngryText);
        
        // Check if particular substring is in a string (such as a name in a list. Using 'rangeOfString:' method, which returns an NSRange. NSRange is a typedef for a struct. It has two members: 'location' and 'length' u can use to pinpoint a substring within a string.  This method returns a NSString whose location is the 'NSNotFound' constant.  To thus, see if a name occurs in the list you can check the return value for the 'location' member.
        NSString *listOfNames = @"Robert, Scharon, Charlie, Mirtha";
        NSString *name = @"Robert";
        NSRange match = [listOfNames rangeOfString:name];
        if (match.location == NSNotFound) {
            NSLog(@"No Match Found! - for %@", name);
            //other locations locations to be taken
        }else{
            NSLog(@"Match Found!");
            //other actions to be taken
        }
        
        
        
        
        
    }
    return 0;
}

