//
//  NSData+Speakable.m
//  ObjC_Book_FINAL_Challenge-SpeakableData
//
//  Created by EvilKernel on 2/5/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "NSData+Speakable.h"

@implementation NSData (Speakable)

- (NSString *)encodeAsSpeakableString {
    // Array of words
    NSArray *brandNames = [[NSArray alloc] initWithObjects:@"Ford", @"Honda", @"Nike", nil];
    unsigned char byte;
    for (int i = 0; i < sizeof(self); i++) {
        [self getBytes:&byte range: NSMakeRange(i, 1)];
        NSLog(@"intial byte: %x", byte);
        unsigned char newByte = byte >> 5;
        NSLog(@"bitwised >> byte: %x", newByte);
        
        
    
    }
    

    
    return @"dumy string return";
 

    
}

+ (NSData *)dataWithSpeakableString:(NSString *)s error:(NSError *__autoreleasing *)e {
    int buffer = 8;
    return [NSData dataWithBytes:&buffer length:sizeof(int)];
}


@end