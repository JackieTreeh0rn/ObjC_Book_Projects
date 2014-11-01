//
//  ZCGForeignStockHolding.m
//  ObjC_CLASSES_ZGCStockHolding_Stocks_Challenge
//
//  Created by EvilKernel on 10/1/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCForeignStockHolding.h"

@implementation ZGCForeignStockHolding

// reimplementing these methods to account for conversion of foreign stock in US dollars
- (float) costInDollars
{
    if (self.conversionRate) { // if conversionRate not nil, process subclass method, else revert to SuperClass method to avoid 0 values.
    float localCostInDollars = [super costInDollars];
    return localCostInDollars * self.conversionRate;
    }else{
        return [super costInDollars];
    }
}

- (float) valueInDollars
{
    if (self.conversionRate) {
    float localValueInDollars = [super valueInDollars];
    return localValueInDollars * self.conversionRate;
    }else{
        return [super valueInDollars];
    }

}
@end