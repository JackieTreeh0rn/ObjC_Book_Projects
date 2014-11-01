//
//  ZGStockHolding.h
//  ObjC_CLASSES_Stocks_Challenge
//
//  Created by EvilKernel on 9/25/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

// ZGCStockHolding CLASS

#import <Foundation/Foundation.h>

@interface ZGCStockHolding : NSObject

{
    // Instance variables (using properties is the way to go instead of this shit)
    float _purchaseSharePrice;
    float _currentSharePrice;
    int _numberOfShares;
    NSString *_shareName;
}

/* Methods / accessors declarations
   setter and getter accessors */
- (float)purchaseSharePrice;
- (void)setPurchaseSharePrice:(float)pp;
- (float)currentSharePrice;
- (void)setCurrentSharePrice:(float)cp;
- (int)numberOfShares;
- (void)setNumberOfShares:(int)n;
- (NSString *)shareName;
- (void)setShareName:(NSString *)name;
- (void)addToStocks:(NSMutableArray *)array; //accesor to add to array via method instead of in main()

// getter cost and value accessors
- (float)costInDollars; // purchaseSharePrice * numberOfShares
- (float)valueInDollars; // currentSharePrice * numberOFShares



@end
