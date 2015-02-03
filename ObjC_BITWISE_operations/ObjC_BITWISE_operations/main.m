//
//  main.m
//  ObjC_BITWISE_operations
//
//  Created by EvilKernel on 2/1/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // BITWISE-OR (| operator)
        /* BITWISE-OR two bytes together to create a third byte.
         A bit on the third byte will be 1 if at least one
         of the corresponding bits in the first two bytes is 1 - the end result is a bitmask that has two bits on
         You can bitwise-OR integers together to achive the setting
         you want, such as with methods that use constants (which are technically integers)
         like NSDataDetector NSTextCheckingTypes. Using the "|" operator to combine
         multiple constants (integers) and end up with a desired third one */
        unsigned char a = 0x3c;
        unsigned char b = 0xa9;
        
        unsigned char c = a | b;
        printf("BITWISE-OR operation...\n");
        printf("Hex: %x | %x = %x\n", a, b, c);
        printf("Decimal: %d | %d = %d\n\n", a, b, c);
        
        // BITWISE-AND (& operator)
        /* BITWISE-AND two bytes together to create a third byte.
         In this case, a bit on the third byte will be 1 only if
         the corresponding bits on the first two bytes are both 1 
         You can use BITWISE-AND to see  a certain bit, or flag, is on. For example
         if you were handed an instance of NSDataDetector you check of it was set to look for phone numbers like this
         "if ([currentDetectir checkingTypes] & NSTextCheckingTypePhoneNumber) { NSLog(@"This one is looking for phone#")}"
         The "checkingTypes" method in this case returns an integer that is the bitwise-OR result of all flags this instance
         of NSDataDetector has on. You bitwise-AND this integer with a particular NSTextCheckingType constant and check the result.
         If the bit that is on in NSTextCheckingTypePhoneNumber is not on in the data detector setting, then the result of the 
         bitwise-ANDing them will be all zeroes. Otherwise, you would get a non-zero result.*/
        unsigned char d = a & b;
        printf("BITWISE-AND operation...\n");
        printf("Hex: %x & %x = %x\n", a, b, d);
        printf("Decimal: %d & %d = %d\n\n", a, b, d);
        
        // BITWISE-XOR (exlcusive-OR)  (^ operator)
        /* BITWISE-XOR two bytes together to create a htid byte.
         A bit in the third byte is 1 if *exactly* one of the corresponding bits in the input bytes is 1 (ie. 1 and 0 only) 
         The ^ operator can be confusing. it does not mean exponentiation (in C we use pow() function for exponentiation: 
         double r = pow(2.0, 3.0) //Calculate 2 raised to the third power */
        unsigned char e = a ^ b;
        printf("BITWISE-XOR operation...\n");
        printf("Hex: %x ^ %x = %x\n", a, b, e);
        printf("Decimal: %d ^ %d = %d\n\n", a, b, e);
        
        // COMPLEMENT (~ operator)
        /* if you have a byte, the complement is the byte that is the exact opposite: each 0 becomes a 1 and each 1 becomes a 0 */
         unsigned char f = ~b;
         printf("COMPLEMENT operation...\n");
         printf("The complement of %x is %x\n", b, f);
         printf("The complement of %d is %d\n\n", b, f);
        
        // LEFT-SHIFT (<< operator)
        /* If you left-shift the bits, you take each bit and move it toweards the most significant bit).
         The ones that are on the left side of the number are forgotten, and the holes created on the right are filled
         with zeroes.
         Everytime you left shift a number one place you double its value*/
        unsigned char g = a << 2; //left shifting by 2
        printf("BITWISE LEFT-SHIFT operation...\n");
        printf("Hex: %x shifted left two places is %x\n", a, g);
        printf("Decimal: %d shifted left two places is %d\n\n", a, g);
        
        // RIGHT-SHIFT (>> operator)
        /* operator should not be much of a surprise, opposite if LEFT SHiFT, it halves the numbers value (if its odd, round down) */
        unsigned char h = a >> 1;
        printf("BITWISE RIGHT-SHIFT operation...\n");
        printf("Hex: %x shifted right one place is %x\n", a, h);
        printf("Decimal: %d shifted right one place is %d\n\n", a, h);
        
        
        
    }
    return 0;
}
