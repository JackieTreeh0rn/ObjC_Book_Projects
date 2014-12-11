//
//  main.m
//  ObjC_PropertyLists_stockz
//
//  Created by EvilKernel on 12/11/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

/// *** PROPERTY LISTS ****
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // BUILDING A PROPERTY LIST using dictionaries //
        NSMutableArray *stockz = [[NSMutableArray alloc] init];
        NSMutableDictionary *stock;
        
        stock = [NSMutableDictionary dictionary]; // dictionary 1
        [stock setObject:@"AAPL"
                  forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200]
                  forKey:@"shares"];
        
        [stockz addObject:stock];
        
        stock = [NSMutableDictionary dictionary]; // dictionary 2
        [stock setObject:@"GOOG"
                  forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:160]
                  forKey:@"shares"];
        
        [stockz addObject:stock];
        
        [stockz writeToFile:@"/tmp/stockz.plist"
                 atomically:YES];
        
        NSLog(@"Wrote a plist file...\n\n"); // not checking here obviously, just logging for illustration
        
        
        // READING THE PROPERTY LIST //
        NSArray *stockzList = [NSArray arrayWithContentsOfFile:@"/tmp/stockz.plist"];
        for (NSDictionary *d in stockzList) {
            NSLog(@"I have %@ shares of %@", [d objectForKey:@"shares"], [d objectForKey:@"symbol"]);
        }
        
        

    }
    return 0;
}
