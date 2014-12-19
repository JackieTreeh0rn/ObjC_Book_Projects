//
//  main.m
//  ObjC_PropertyLists_with-all-8-datatypes - Challenge
//
//  Created by EvilKernel on 12/11/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>


 /// PROPERTY LISTS - writing a Property list that has all 8 types in it: array, dictionary, string, data, date, integer, float, and boolean ///

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // BUILD a container aray to house the various objects
        //NSMutableArray *mainArray = [NSMutableArray alloc];

        // an Array
        NSArray *anArray = @[@"string1", @"string2", @"string3"];
        
        // a Dictionary (literal) with various object types
        NSDictionary *aDictionary = @{ @"aFloat" : @1.2,
                                       @"anInteger1" : [NSNumber numberWithInt:122],
                                       @"anInteger2" : @65,
                                       @"aString" : @"Hello World",
                                       @"anArray" : @[@"Yellow", @"Red", @"Blue"],
                                      };
        // NSLog(@"%@", dictionary[@"anArray"]);
        
        // a String
        NSString *aString = @"This is a String";
        
        // a Date
        NSDate *aDate = [NSDate date];
        
        // an Integer
        NSNumber *anInt = @10;
        
        // a Float
        NSNumber *aFloat = [NSNumber numberWithFloat:3.1345];
        
        //a BOOLean
        NSNumber *aBool = [NSNumber numberWithBool:YES];
        
        // an NSData
        NSData *aData = [NSData dataWithContentsOfFile:@"/tmp/nsdatadummy.log"];
        
        // an NSString
        NSString *aStringFromData = [[NSString alloc] initWithData:aData encoding:NSUTF8StringEncoding]; // string with data (used to display nsdata as string instead of hex)
        
        
        // ADD ALL objects TO array container
        NSMutableArray *mainArray = [[NSMutableArray alloc] initWithObjects:anArray, aDictionary, aString, aDate, anInt, aFloat, aBool, aData, aStringFromData, nil];
        
        
        // WRITE array container to plist
        BOOL written = [mainArray writeToFile:@"/tmp/aPropertyList.plist"  // using BOOL here for illustration but could just do a mainarray write
                    atomically:YES];
        
        if (!written) {
            NSLog(@"Plist not written, exiting..");
            return 1;
        }
        // READ Plist
        NSArray *inputPlist = [NSArray arrayWithContentsOfFile:@"/tmp/aPropertyList.plist"];
        NSLog(@"%@", inputPlist);
        
       // NSData *inputDataPlist = [NSPropertyListSerialization dataWithPropertyList:@"/tmp/aPropertyList.plist" format:NSPropertyListXMLFormat_v1_0 options:0 error:nil];
       // NSArray *input = [NSKeyedUnarchiver unarchiveObjectWithData:inputDataPlist];
       /*     for (NSNumber *a in inputPlist) {
                if (a.integerValue) {
                    NSLog(@"Here's are some integers: %ld", a.integerValue);
                }
                
                if (a.floatValue) {
                    NSLog(@"Here are some floats: %f", a.floatValue);
                }
                
                if (a.boolValue) {
                    NSLog(@"Here is a BOOL: %hhd", a.boolValue);
                }
                
            for (NSString *s in inputPlist) {
                    NSLog(@"Here are some strings: %@", s);
                }
                
            for (NSMutableArray *a in inputPlist) {
                    NSLog(@"Here are some arrays: %@", a);
                }
                
            for (NSArray *a in inputPlist) {
                    NSLog(@"Here's an array: %@", a);
                }

            } */
        
        
    
    
    }
    return 0;
}
