//
//  ZGCStockHolding.m
//  ObjC_Classes_ZGCPortfolio_Stocks_Challenge
//
//  Created by EvilKernel on 10/12/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCStockHolding.h"


@implementation ZGCStockHolding

- (void)addToStocks:(NSMutableArray *)array
{
    [array addObject:self];
}

- (float)costInDollars
{
    return [self purchaseSharePrice] * [self numberOfShares];
}

- (float)valueInDollars
{
    return [self currentSharePrice] * [self numberOfShares];
}



@end
