//
//  NSData+Speakable_3.m
//  ObjC_Book_FINAL_Challenge-SpeakableData
//
//  Created by EvilKernel on 2/12/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "NSData+Speakable_3.h"

@implementation NSData (Speakable_3)
static unsigned char higherMask = 7 << 5;

+ (NSArray *)brands
{
    return @[@"Camry", @"Nikon", @"Apple", @"Ford", @"Audi", @"Google", @"Nike", @"Amazon",
             @"Honda", @"Mazda", @"Buick", @"Fiat", @"Jeep", @"Lexus", @"Volvo", @"Fuji",
             @"Sony", @"Delta", @"Focus", @"Puma", @"Samsung", @"Tivo", @"Halo", @"Sting",
             @"Shrek", @"Avatar", @"Shell", @"Visa", @"Vogue", @"Twitter", @"Lego", @"Pepsi"];
}

- (NSString *)encodeAsSpeakableString
{
    NSMutableString *speakable = [[NSMutableString alloc] init];
    const unsigned char *data = [self bytes];
    if (data) {
        for (int i = 0; i < [self length]; i++) {
            unsigned char lower = data[i] & ~higherMask;
            
            // higher is 3 higher bits +2 as we encode between 2 and 9
            unsigned char higher = ((data[i] & higherMask) >> 5) + 2;
            
            if ([speakable length]) {
                [speakable appendString:@" "];
            }
            [speakable appendString:[NSString stringWithFormat:@"%d %@", higher, [NSData brands][lower]]];
        }
    }
    return speakable;
}

+ (NSData *)dataWithSpeakableString:(NSString *)s error:(NSError **)e
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSArray *components = [s componentsSeparatedByString:@" "];
    unsigned char value = 0;
    for (NSString *s in components) {
        unsigned char higher = [s intValue];
        if (higher) {
            value = (higher - 2) << 5;
        } else {
            NSUInteger lower = [[NSData brands] indexOfObject:s];
            if (lower == NSNotFound) {
                if (e) {
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : @"Unable to parse"};
                    *e = [NSError errorWithDomain:@"SpeakableBytes" code:1 userInfo:userInfo];
                    return nil;
                }
            }
            value += lower;
            [data appendBytes:&value length:1];
        }
    }
    return data;
}
@end
