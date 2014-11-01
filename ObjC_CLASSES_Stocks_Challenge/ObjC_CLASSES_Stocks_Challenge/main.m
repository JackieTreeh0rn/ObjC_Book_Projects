//
//  main.m
//  ObjC_CLASSES_Stocks_Challenge
//
//  Created by EvilKernel on 9/25/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>
// #import "ZGCStockHolding.h"
#import "ZGCForeignStockHolding.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Three 'stock' instances
        ZGCStockHolding *stockUS1 = [[ZGCForeignStockHolding alloc] init];
        [stockUS1 setShareName:@"US1 Stock"];
        [stockUS1 setNumberOfShares:40];
        [stockUS1 setPurchaseSharePrice:2.30];
        [stockUS1 setCurrentSharePrice:4.50];

        ZGCStockHolding *stockUS2 = [[ZGCForeignStockHolding alloc] init];
        [stockUS2 setShareName:@"US2 Stock"];
        [stockUS2 setNumberOfShares:90];
        [stockUS2 setPurchaseSharePrice:12.19];
        [stockUS2 setCurrentSharePrice:10.56];
        
        // new instsance of subclass ZGCForeignStockholding
        ZGCForeignStockHolding *stockUK = [[ZGCForeignStockHolding alloc] init];
        stockUK.shareName = @"UK Stock";
        stockUK.numberOfShares = 10;  // subclass can use variables from its SuperClass
        stockUK.purchaseSharePrice = 1.50;
        stockUK.currentSharePrice = 2.00;
        stockUK.conversionRate = 1.50; // new property via new subclass
        
        ZGCForeignStockHolding *stockCH = [[ZGCForeignStockHolding alloc] init];
        stockCH.shareName = @"China Stock";
        stockCH.numberOfShares = 10;  // subclass can use variables from its SuperClass
        stockCH.purchaseSharePrice = 1.50;
        stockCH.currentSharePrice = 2.00;
        stockCH.conversionRate = 3.55; // new property via new subclass
        
        // added a method/accessor to the CLASS as experiment (addToStock), which uses 'self' to add the object to an array
        // via the method instead of explicitely in main()
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        [stockUS1 addToStocks:stocks];
        [stockUS2 addToStocks:stocks];
        [stockUK addToStocks:stocks]; // it can use methods from SuperClass too
        [stockCH addToStocks:stocks];
        
        // pull currency locale information
        NSLocale *userLocale = [NSLocale currentLocale];
        NSString *currencyCode = [userLocale objectForKey:NSLocaleCurrencyCode];
        NSString *currencySym = [userLocale objectForKey:NSLocaleCurrencySymbol];
        
        NSLog(@"Your Currency: (%@) %@", currencySym, currencyCode);
        
        // Iterate over array
        for (ZGCForeignStockHolding *s in stocks) { // using fast enum loop for arrays
            if ([currencySym isEqualTo:@"$"]) {
                s.conversionRate = 0;
            }else{
                s.conversionRate = s.conversionRate;
                NSLog(@"Your conversion rate from %@ to USD: %.2f", currencyCode, s.conversionRate);
            }
            float cost = [s costInDollars];
            float value = [s valueInDollars];
            NSLog(@"You paid $%.2fUSD for %d shares of %@, now valued at $%.2fUSD", cost, [s numberOfShares], [s shareName], value);

            
            
        }
    }
    return 0;
}

