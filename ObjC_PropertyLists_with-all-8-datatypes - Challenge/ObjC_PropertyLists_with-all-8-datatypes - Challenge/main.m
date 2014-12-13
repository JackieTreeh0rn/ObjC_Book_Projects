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
        NSArray *stringArray = @[@"string1", @"string2", @"string3"];
        
        // a Dictionary (literal) with various object types
        NSDictionary *dictionary = @{ @"aFloat" : @1.2,
                                      @"anInteger1" : [NSNumber numberWithInt:122],
                                      @"anInteger2" : @65,
                                      @"aString" : @"Hello World",
                                      @"anArray" : @[@"Hola", @"Mundo"],
                                      };
        // NSLog(@"%@", dictionary[@"anArray"]);
        
        // a String
        NSString *myString = @"This is a String";
        
        // a Date
        NSDate *nowDate = [NSDate date];
        
        // an Integer
        NSNumber *anInt = @10;
        // a Float
        NSNumber *aFloat = [NSNumber numberWithFloat:3.1345];
        
        //a BOOLean
        BOOL aBool;
        // NSLog(@"%d", isOK); // is 1
        
        // an NSData
        NSData *aData = [NSData dataWithContentsOfFile:@"/tmp/nsdatadummy.log"];
        
        
        // ADD all objects TO array container
        NSMutableArray *mainArray = [[NSMutableArray alloc] initWithObjects:stringArray, dictionary, myString, nowDate, anInt, aFloat, aBool, aData, nil];
        
        // WRITE array container to plist
        [mainArray writeToFile:@"/tmp/aPropertyList.plist"
                    atomically:YES];
        
        
        
        
        
        
        
        
        
    }
    return 0;
}
