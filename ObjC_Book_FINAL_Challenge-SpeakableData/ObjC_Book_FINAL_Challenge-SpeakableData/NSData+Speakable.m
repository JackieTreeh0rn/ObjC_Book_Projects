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
    // Build Array of 32 words (2 raised to the power of 5 (bits)
    NSArray *brandNames = [[NSArray alloc] initWithObjects:@"Camry",@"Nikon", @"Apple", @"Ford", @"Audi", @"Google",@"Nike", @"Amazon", @"Honda", @"Mazda", @"Buick",@"Fiat", @"Jeep", @"Lexus", @"Volvo", @"Fuji",@"Sony", @"Delta", @"Focus", @"Puma", @"Samsung",@"Tivo", @"Halo", @"Sting", @"Shrek", @"Avatar",@"Shell", @"Visa", @"Vogue", @"Twitter", @"Lego",@"Pepsi", nil];
    // define a varible to hold each character from the receiving NSData object
    unsigned char aByte;
    // Define a Mutable String to store the speakable string
    NSMutableString *speakable = [[NSMutableString alloc] init];
    for (int i = 0; i < sizeof(self); i++) { // could also use self.length
        [self getBytes:&aByte range: NSMakeRange(i, 1)]; // increment the range in this method using the loop
        //NSLog(@"intial byte: %x", byte); // above method puts byte in suppled buffer (for the byte variable)
        // Declare a variable to store portion of the byte we will use for a number (3 bits)
        // We perform a BITWISE rightwise operation to considers only first 3 bits
        // Then, 0x7, in bit, is |0|0|0|0|0|1|1|1|. first3Bit & 0x7 will give us a number between 0 and 7. Then we add 2 because we don't consider 0 or 1.
        unsigned char number = ((aByte >> 5) & 0x7) + 2;
        //NSLog(@"bitwised \">>\" byte: %x", number);
        // Declare a variable to store portion of the byte we will use for the name (5 bits)
        // We perform a BITWISE & operation. 0x1f in this case, is |0|0|0|1|1|1|1|1|.
        unsigned char name = aByte & 0x1f;
        //NSLog(@"bitwised \"&\" byte: %x", name); // This should be in [0,31]
        
        if (i != self.length - 1) {
            NSString *firstPartOfString = [NSString stringWithFormat:@"%d", number];
            NSString *secondPartOfString = [NSString stringWithFormat:@"%@", brandNames[name]];
            [speakable appendString:firstPartOfString];
            [speakable appendString:secondPartOfString];
        }else{
            NSString *firstPartOfString = [NSString stringWithFormat:@"%d", number];
            NSString *secondPartOfString = [NSString stringWithFormat:@"%@", brandNames[name]];
            [speakable appendString:firstPartOfString];
            [speakable appendString:secondPartOfString];
        }
        
        
        
        
    
    }

    
    return speakable;
    
}

+ (NSData *)dataWithSpeakableString:(NSString *)s error:(NSError *__autoreleasing *)e {
    NSString *errorSpecification = [[NSString alloc] init];
    BOOL success = true;
    
    if (!s) {//if the string is empty then we return nothing!
        success = false;
        errorSpecification = @"No string given";
    }
    NSDictionary *theList = @{@"Camry" : @0,@"Nikon" : @1, @"Apple" : @2, @"Ford" : @3,
                              @"Audi" : @4, @"Google" : @5, @"Nike" : @6, @"Amazon" : @7,
                              @"Honda" : @8, @"Mazda" : @9, @"Buick" : @10, @"Fiat" : @11,
                              @"Jeep" : @12, @"Lexus" : @13, @"Volvo" : @14, @"Fuji" : @15,
                              @"Sony" : @16, @"Delta" : @17, @"Focus" : @18, @"Puma" : @19,
                              @"Samsung" : @20, @"Tivo" : @21, @"Halo" : @22, @"Sting" : @23,
                              @"Shrek" : @24, @"Avatar" : @25, @"Shell" : @26, @"Visa" : @27,
                              @"Vogue" : @28, @"Twitter" : @29, @"Lego" : @30,@"Pepsi" : @31, };
    NSMutableData *result = [NSMutableData data];
    
    NSUInteger i = 0;
    while (i < s.length && success) {//i=0 means that we start from the first character. Then i will become (if there is no error) the index after the space after the word after the digit that is in position i.
        NSCharacterSet *digits = [NSCharacterSet decimalDigitCharacterSet];//the digits 0--9
        NSCharacterSet *space = [NSCharacterSet whitespaceCharacterSet];//the space character
        NSCharacterSet *letters = [NSCharacterSet letterCharacterSet];//the letters
        //If the first char of the string is not a digit then we have an error and we return it.
        //Similarly, if the string is not well formatted. i.e. that there is a word starting at index digitRange.location+2.
        BOOL isItADigit = [digits characterIsMember:[s characterAtIndex:i]];
        BOOL isItASpace = [space characterIsMember:[s characterAtIndex:i+1]];
        BOOL isItALetter = [letters characterIsMember:[s characterAtIndex:i+2]];
        if (!isItADigit | !isItASpace | !isItALetter){
            success = false;
            errorSpecification = @"String not formatted well";
            break;
        }
        
        //Need to find the word. We know that the word 'should' start at index digitRange.location+1 (otherwise there is an error because the string is not formatted us we require). We need to find where the word ends.
        NSRange searchRange;
        searchRange.location = i+2;
        searchRange.length = [s length] - searchRange.location;
        NSRange spaceRange = [s rangeOfCharacterFromSet:space
                                                options:NSLiteralSearch
                                                  range:searchRange];
        NSRange theWordRange;
        if (spaceRange.length != 0){
            //now we know that the word goes from i+2 to spaceRange.location therefore the range starts from i+2 and has length spaceRange.location - (i+2) + 1
            theWordRange.location = i+2;
            theWordRange.length = spaceRange.location - (i+2) + 1;
        } else{//if there is no space after the word then we end the string. Hence we need to say that the word starts at location i+2 and terminate at the end of the string.
            theWordRange.location = i+2;
            theWordRange.length = [s length] - (i+2);
            spaceRange.location = s.length;//because since there is no space there is no location
        }
        //I use getCharacters:range: so I need a buffer.
        //=======IS THERE A BETTER WAY TO DO THE FOLLOWING x LINES??? CHECK!=======
        NSUInteger lengthOfBuffer = spaceRange.location - i - 2;
        unichar aBuffer[lengthOfBuffer];
        [s getCharacters:aBuffer
                   range:theWordRange];
        NSString *word = [NSString stringWithCharacters:aBuffer
                                                 length:lengthOfBuffer];
        //Now we need to know at which position in theList the word sits (this is the reason why we used the dictionary structure, rather than an array).
        if (![theList objectForKey:word]){
            success = false;
            errorSpecification = @"Word not in the string";
            break;
        }
        int64_t numberAtPositionI = [s characterAtIndex:i] & 0x07;
        int64_t theDigitInPositionIMinusTwo = numberAtPositionI - 2;
        int64_t firstPart = (theDigitInPositionIMinusTwo & 0x07) << 5 ;//This is the first 3 bits. Then we need OR with the number that represents the position of the word.
        //Now the second part of the byte
        int64_t secondPart;
        secondPart = [[theList objectForKey:word] longLongValue] & 0x1f;
        int64_t finalByte = secondPart | firstPart ;
        [result appendBytes:&finalByte length:1];
        
        i = spaceRange.location + 1;// now we start from the character after the (first) space after the word
    }
    
    //if success is false then we terminate the loop for one of the following reasons:
    //1. the string sintax was not right: i.e. not like "number "1space" word"
    //2. the word was not in our list
    if (!success) {
        if (e) {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey:errorSpecification};
            *e = [NSError errorWithDomain:@"SpeakableBytes"
                                     code:1
                                 userInfo:userInfo];
            return nil;
        }
    }
    return [result copy];
}



@end