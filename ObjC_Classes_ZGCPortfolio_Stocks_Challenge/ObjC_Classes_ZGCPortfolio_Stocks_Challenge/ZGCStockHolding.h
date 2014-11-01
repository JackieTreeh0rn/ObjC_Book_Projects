//
//  ZGCStockHolding.h
//  ObjC_Classes_ZGCPortfolio_Stocks_Challenge
//
//  Created by EvilKernel on 10/12/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h> 

@interface ZGCStockHolding : NSObject

// declaring properties
@property (nonatomic) float purchaseSharePrice;
@property (nonatomic) float currentSharePrice;
@property (nonatomic) int numberOfShares;
@property (nonatomic, copy) NSString *symbol;

// declaring methods
// - (void)addToStocks:(NSMutableArray *)array; //add to array via method instead of in main()
- (float)costInDollars; // purchaseSharePrice * numberOfShares
- (float)valueInDollars; // currentSharePrice * numberOFShares




@end

