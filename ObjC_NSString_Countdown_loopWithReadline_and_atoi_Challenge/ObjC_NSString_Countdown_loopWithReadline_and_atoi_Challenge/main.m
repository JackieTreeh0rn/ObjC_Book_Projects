//
//  main.m
//  ObjC_NSString_Countdown_loopWithReadline_and_atoi_Challenge
//
//  Created by EvilKernel on 9/7/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Countdown Challenge with NSString and NSLog and UTF Method (remake from Chapter 8)
        NSLog(@"count back from input number to 0 in increments of 3.  When # divisible by 5 is found, display message");
        NSLog(@"At what number beween 99 and 0 should I start counting from?");
        
        //ask for input
        const char *readlin = readline(NULL); //readline input set to NULL for now until input is provided
        NSString *input = [NSString stringWithUTF8String:readlin]; //convert const char * to NSString
        //// nested one-liner approach w/out const char * declaration: NSString *input = [NSString stringWithUTF8String:readline(NULL)]; ///
        NSInteger i;
        for (i = [input intValue]; i > -1; i-=3) { //convert string to integer (objc approach versus atoi() C function  /// nested one line approach for the loop: for (NSInteger i = [input intValue]; i > -1; i=-3) ///
            BOOL divByFive = ((i % 5) == 0);
            if (divByFive) {
                NSLog(@"%ld...found one!", i);
            }else{
                NSLog(@"%ld...", i);
            }
        }
        
        
        
        
    }
    return 0;
}

