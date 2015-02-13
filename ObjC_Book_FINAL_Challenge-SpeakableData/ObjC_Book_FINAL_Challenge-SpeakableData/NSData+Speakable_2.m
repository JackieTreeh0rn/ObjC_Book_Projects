//
//  NSData+Speakable_2.m
//  ObjC_Book_FINAL_Challenge-SpeakableData
//
//  Created by EvilKernel on 2/12/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "NSData+Speakable_2.h"

@implementation NSData (Speakable_2)
- (NSString *)encodeAsSpeakableString
{
    NSMutableString *str = [[NSMutableString alloc] init];
    
    NSArray *brands = [[NSArray alloc] initWithObjects:@"Camry",
                       @"Nikon", @"Apple", @"Ford", @"Audi", @"Google",
                       @"Nike", @"Amazon", @"Honda", @"Mazda", @"Buick",
                       @"Fiat", @"Jeep", @"Lexus", @"Volvo", @"Fuji",
                       @"Sony", @"Delta", @"Focus", @"Puma", @"Samsung",
                       @"Tivo", @"Halo", @"Sting", @"Shrek", @"Avatar",
                       @"Shell", @"Visa", @"Vogue", @"Twitter", @"Lego",
                       @"Pepsi", nil];
    
    int64_t aBytes;
    
    for (int i = 0; i < 8; i++) {
        [self getBytes:&aBytes range:(NSRange){i, 1}];
        
        int64_t leftThreeBits = (aBytes >> 5);
        int64_t digit = (leftThreeBits + 2) & 0xff;
        int64_t rightFiveBits = aBytes & 0x1f;
        
        [str appendFormat:@"%lld %@ ", digit, brands[rightFiveBits]];
    }
    
    [str deleteCharactersInRange:NSMakeRange([str length]-1, 1)];
    return [str copy];
    
}

+ (NSData *)dataWithSpeakableString:(NSString *)s
                              error:(NSError **)e
{
    NSArray *brands = [[NSArray alloc] initWithObjects:@"Camry",
                       @"Nikon", @"Apple", @"Ford", @"Audi", @"Google",
                       @"Nike", @"Amazon", @"Honda", @"Mazda", @"Buick",
                       @"Fiat", @"Jeep", @"Lexus", @"Volvo", @"Fuji",
                       @"Sony", @"Delta", @"Focus", @"Puma", @"Samsung",
                       @"Tivo", @"Halo", @"Sting", @"Shrek", @"Avatar",
                       @"Shell", @"Visa", @"Vogue", @"Twitter", @"Lego",
                       @"Pepsi", nil];
    
    NSArray *speakableArray = [s componentsSeparatedByString:@" "];
    NSCharacterSet *digits = [NSCharacterSet decimalDigitCharacterSet];
    
    int64_t digit = 0;
    int64_t tmp = 0;
    int64_t aBytes = 0;
    
    for (int i = 0; i < [speakableArray count]; i++) {
        NSString *n = speakableArray[i];
        BOOL isDigit = [digits characterIsMember:[n characterAtIndex:0]];
        
        if (i % 2 == 0 && !isDigit) {
            if (e) {
                NSDictionary *userInfo = @{ NSLocalizedDescriptionKey:@"Unable to parse"};
                *e = [NSError errorWithDomain:@"SpeakableBytes"
                                         code:1
                                     userInfo:userInfo];
                return nil;
            }
        }
        
        if (isDigit) {
            digit = [n longLongValue] - 2;
            tmp = digit << 5;
        } else {
            digit = [brands indexOfObject:n];
            tmp |= digit;
        }
        
        if (i % 2) {
            aBytes |= tmp << (4 * (i - 1));
        }
    }
    NSData *outData = [NSData dataWithBytes:&aBytes
                                     length:sizeof(int64_t)];
    return outData;
}

@end
