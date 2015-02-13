//
//  NSData+Speakable_4.h
//  ObjC_Book_FINAL_Challenge-SpeakableData
//
//  Created by EvilKernel on 2/12/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Speakable_4)
// adding two methods as a Category of NSData
- (NSString *)encodeAsSpeakableString; // take a buffer of bytes and return a string that represents those bytes
+ (NSData *)dataWithSpeakableString:(NSString *)s
                              error:(NSError **)e; // take a string and return the buffer of bytes it represents
@end
