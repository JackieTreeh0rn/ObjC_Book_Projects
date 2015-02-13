//
//  NSData+Speakable_3.h
//  ObjC_Book_FINAL_Challenge-SpeakableData
//
//  Created by EvilKernel on 2/12/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>
// FROM STANDFORD UNIV COURSE in iTunes U "Developping iOS apps" - quite elegant!

@interface NSData (Speakable_3)
// adding two methods as a Category of NSData
- (NSString *)encodeAsSpeakableString; // take a buffer of bytes and return a string that represents those bytes
+ (NSData *)dataWithSpeakableString:(NSString *)s
                              error:(NSError **)e; // take a string and return the buffer of bytes it represents
+ (NSArray *)brands; // fetch array of brands (add-on to challenge, in order to have a single data source)

@end
