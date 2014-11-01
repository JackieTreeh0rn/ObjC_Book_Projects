//
//  ZGCPortfolio.h
//  ObjC_Classes_ZGCPortfolio_Stocks_Challenge
//
//  Created by EvilKernel on 10/13/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZGCForeignStockHolding; // 

@interface ZGCPortfolio : NSObject


// declaring properties
//@property (nonatomic, copy) NSMutableArray *holdings; <--turned into class extension

@property (nonatomic, copy) NSArray *holdings; // could be turned off at this point, have getHoldings method to get holdings array.

// declaring methods
- (void)addHoldings:(ZGCForeignStockHolding *)h;
- (void)removeHoldings:(ZGCForeignStockHolding *)h;
- (NSArray *)getHoldings;
- (float)totalValue;
- (NSArray *)topThreeHoldings; // filter & sort method


@end

