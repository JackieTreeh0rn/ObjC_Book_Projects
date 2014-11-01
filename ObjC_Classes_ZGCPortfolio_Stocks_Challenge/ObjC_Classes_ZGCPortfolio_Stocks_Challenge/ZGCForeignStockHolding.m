//
//  ZGCForeignStockHolding.m
//  ObjC_Classes_ZGCPortfolio_Stocks_Challenge
//
//  Created by EvilKernel on 10/12/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCForeignStockHolding.h"

@implementation ZGCForeignStockHolding

// overriding these methods to account for conversion of foreign stock in US dollars
- (float)costInDollars
{
    if (self.conversionRate) { // if conversionRate not nil, process subclass method, else revert to SuperClass method to avoid 0 values.
        float localCostInDollars = [super costInDollars];
        return localCostInDollars * self.conversionRate;
    }else{
        return [super costInDollars];
    }
}

- (float)valueInDollars
{
    if (self.conversionRate) {
        float localValueInDollars = [super valueInDollars];
        return localValueInDollars * self.conversionRate;
    }else{
        return [super valueInDollars];
    }
    
}

- (NSString *)description //overriding descriptipn method
{
    // pull Currency locale information
    NSLocale *userLocale = [NSLocale currentLocale];
    NSString *currencyCode = [userLocale objectForKey:NSLocaleCurrencyCode];
    NSString *currencySym = [userLocale objectForKey:NSLocaleCurrencySymbol];
    float cost = [self costInDollars];
    float value = [self valueInDollars];
    if ([currencySym isEqualTo:@"$"]) {
        self.conversionRate = 0;
        return [NSString stringWithFormat:@"You paid $%.2fUSD for %d shares of %@, now valued at $%.2fUSD", cost, [self numberOfShares], [self symbol], value];
    }else{
        
    NSString *conversionRateLog = [NSString stringWithFormat:@"Your conversion rate from %@ to USD: %.2f", currencyCode, self.conversionRate];
    return [NSString stringWithFormat:@"%@, You paid $%.2fUSD for %d shares of %@, now valued at $%.2fUSD", conversionRateLog, cost, [self numberOfShares], [self symbol], value];
    }
}
@end
