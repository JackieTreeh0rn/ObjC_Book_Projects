//
//  ZGStockHolding.m
//  ObjC_CLASSES_Stocks_Challenge
//
//  Created by EvilKernel on 9/25/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCStockHolding.h" // import declarations

// implement accessors / methods

@implementation ZGCStockHolding

- (float)purchaseSharePrice
{
    return _purchaseSharePrice;
}

- (void)setPurchaseSharePrice:(float)pp
{
    _purchaseSharePrice = pp;
}

- (float)currentSharePrice
{
    return _currentSharePrice;
}

- (void)setCurrentSharePrice:(float)cp
{
    _currentSharePrice = cp;
}

- (int)numberOfShares
{
    return _numberOfShares;
}

- (void)setNumberOfShares:(int)n
{
    _numberOfShares = n;
}

- (NSString *)shareName
{
    return _shareName;
}

- (void)setShareName:(NSString *)name
{
    _shareName = name;
}

- (void)addToStocks:(NSMutableArray *)array
{
    [array addObject:self];
}

- (float)costInDollars
{
    return [self purchaseSharePrice] * [self numberOfShares]; // using self instead of explicit _variables
}

- (float)valueInDollars
{
    return [self currentSharePrice] * [self numberOfShares]; // using self instead of actual _variables
}



@end
