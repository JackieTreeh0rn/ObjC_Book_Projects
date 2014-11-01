//
//  ZGCPortfolio.m
//  ObjC_Classes_ZGCPortfolio_Stocks_Challenge
//
//  Created by EvilKernel on 10/13/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCPortfolio.h"
#import "ZGCForeignStockHolding.h"


@interface ZGCPortfolio()  //---class extension - hide mutability ---
{
    NSMutableArray *_holdings;
}

@end

@implementation ZGCPortfolio


- (void)setHoldings:(NSArray *)h
{
    _holdings = [h mutableCopy];
}

- (NSArray *)holdings
{
    return [_holdings copy];
}

- (void)addHoldings:(ZGCForeignStockHolding *)h;
{
    if (!_holdings){ // if no aray exists yet, build it
        _holdings = [[NSMutableArray alloc] init];
    }
    [_holdings addObject:h]; //add holding to array
    
}

- (void)removeHoldings:(ZGCForeignStockHolding *)h
{
    if (self.holdings.count < 1) {
        NSLog(@"There are no more holdings left in this Portfolio");
    }
    [_holdings removeObject:h];
}

- (NSArray *)getHoldings
{
    NSSortDescriptor *sym = [NSSortDescriptor sortDescriptorWithKey:@"symbol" ascending:YES];
    [_holdings sortUsingDescriptors:@[sym]];
    return self.holdings;
    // or use  return [_holdings sortedArrayUsingDescriptors:@[sym]];

}

- (float)totalValue
{
    float sum = 0;
    for (ZGCForeignStockHolding *s in _holdings) {
        sum += [s valueInDollars];
    }
    return sum;
}

- (NSArray *)topThreeHoldings
{
    NSSortDescriptor *voh = [NSSortDescriptor sortDescriptorWithKey:@"valueInDollars" ascending:NO];
    NSSortDescriptor *sym = [NSSortDescriptor sortDescriptorWithKey:@"symbol" ascending:YES];
    [_holdings sortUsingDescriptors:@[voh, sym]];
    return @[_holdings[0], _holdings[1], _holdings[2]]; //shorthand way to return NSArray one liner
}

- (NSString *)description //overriding description method
{
    return [NSString stringWithFormat:@"\n\n**** Your Portfolio's total worth is valued at $%.2fUSD ****\n\n", self.totalValue];

}
@end
