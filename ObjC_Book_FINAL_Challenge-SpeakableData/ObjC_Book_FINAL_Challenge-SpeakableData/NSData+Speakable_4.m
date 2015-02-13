//
//  NSData+Speakable_4.m
//  ObjC_Book_FINAL_Challenge-SpeakableData
//
//  Created by EvilKernel on 2/12/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import "NSData+Speakable_4.h"
/*
 encodeAsSpeakableString was certainly the easiest to create (as mentioned in the book), but dataWithSpeakableString was not too difficult. For dataWithSpeakableString, I did not work with breaking the data into ranges, but broke the datastring into an NSStrings array and then just went through the parts. When the length of the part was one character, I got the value, and converted it. If the part was longer, it was a name bit, so looked for the index that belonged to the name. Then mashed the two bits together (with some manipulation to revert earlier changes) and stuffed it into an NSMutableArray... */

@implementation NSData (Speakable_4)
const uint FIRST_BYTE_MIN = 0x02;
const uint FIRST_BYTE_MAX = 0x09;
const uint BRAND_NAME_COUNT = 32;
const uint SHIFT_COUNT = 3;
const char * brandNameArray[BRAND_NAME_COUNT] = { "Camry", "Nikon", "Apple", // could also let the compiler figure out the count "[]"
    "Ford", "Audi", "Google",
    "Nike", "Amazon", "Honda",
    "Mazda", "Buick", "Fiat",
    "Jeep", "Lexus", "Volvo",
    "Fuji", "Sony", "Delta",
    "Focus", "Puma", "Samsung",
    "Tivo", "Halo", "Sting",
    "Shrek", "Avatar", "Shell",
    "Visa", "Vogue", "Twitter",
    "Lego", "Pepsi"};

- (NSString *) encodeAsSpeakableString
{
    BOOL success = YES;
    
    NSMutableString *result = [NSMutableString string];
    const char *bytes = [self bytes];
    for (int index = 0; index < [self length]; index++)
    {
        // first three bits represented as digits 2 > 9 inclusive
        unsigned char firstByte = ((unsigned char) bytes[index] & 0x7) + FIRST_BYTE_MIN; //to strip out the first three bits (0x1+0x2+0x4) of the data, then simply add a value to make it start at two.

        unsigned char brandNameIndex = ((unsigned char) bytes[index]) >> SHIFT_COUNT; //to shift the byte to loose the three bytes extracted above. Taken together, the two parts, include all the data the original byte contained, but now in two parts.
        
        
        // check values:
        success = firstByte >= FIRST_BYTE_MIN &&
        firstByte <= FIRST_BYTE_MAX &&
        brandNameIndex < BRAND_NAME_COUNT;
        
        if (success)
        {
            // using white space to separate the elements
            [result appendFormat:@"%d %s ", firstByte, brandNameArray[brandNameIndex]];
        }
        else
        {
            NSLog(@"encodeAsSpeakableString error");
        }
    }
    
    return success ? result : nil;
}

+ (NSData *) dataWithSpeakableString: (NSString *) s error:(NSError **) e
{
    BOOL success = YES;
    
    NSMutableArray static * brandNames  = nil;
    
    // Used to pull apart incoming NSString into parts
    NSCharacterSet * spaces = [NSCharacterSet whitespaceCharacterSet];
    NSArray * partsOfString = [s componentsSeparatedByCharactersInSet:spaces];
    
    // used to assemble parts into data
    unsigned char firstBit = 0;
    unsigned char secondBit = 0;
    unsigned char combinedBits = 0;
    
    // used to compile parts into data
    NSMutableData * result = [[NSMutableData alloc] initWithLength: 0];
    
    if (!brandNames)
    {
        // instantiate mutable array of names and fill with names from c strings
        brandNames = [[NSMutableArray alloc] init];
        
        for (uint loop = 0; loop < BRAND_NAME_COUNT; loop++)
        {
            [brandNames addObject:[NSString stringWithFormat:@"%s", brandNameArray[loop]]];
        }
    }
    
    for (NSString * part in partsOfString)
    {
        // parts consist of single character (a digit) or many characters
        if ([part length] == 1)
        {
            // get the value of the part
            firstBit = [part intValue];
            
            if (firstBit >= FIRST_BYTE_MIN) // not a zero (a non digit or too low of a number)
            {
                // shift back to what it was before
                firstBit -= FIRST_BYTE_MIN;
            }
            else
            {
                success = NO;
                break;
            }
        }
        else if ([part length] > 1)
        {
            // parse brandNameArray looking for this string
            NSUInteger index = [brandNames indexOfObject:part];//<< SHIFT_COUNT;
            
            if (index != NSNotFound)
            {
                // set second bit and combine together
                secondBit = index << SHIFT_COUNT;
                combinedBits = firstBit | secondBit;
                
                [result appendData:[[NSData alloc] initWithBytes:&combinedBits length:sizeof(combinedBits)]];
            }
            else // empty
            {
                success = NO;
                break;
            }
        }
    }
    
    if (!success)        // The test for success verifies that the firstByte is within the expected limits, and that brandNameIndex is less than the count of brand names.
    {
        if (e)
        {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey : @"Unable to parse"};
            *e = [NSError errorWithDomain:@"SpeakableBytes" code:1 userInfo:userInfo];
        }
        return nil;
    }
    else
    {
        return result;
    }
}

@end
