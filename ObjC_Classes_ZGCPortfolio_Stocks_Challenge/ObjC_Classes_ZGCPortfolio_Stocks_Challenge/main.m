//
//  main.m
//  ObjC_Classes_ZGCPortfolio_Stocks_Challenge
//
//  Created by EvilKernel on 10/12/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZGCForeignStockHolding.h"
#import "ZGCPortfolio.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // Two US 'stock' instances
        
        ZGCForeignStockHolding *stockUS1 = [[ZGCForeignStockHolding alloc] init];
        stockUS1.symbol = @"APPL";
        stockUS1.numberOfShares = 40;
        stockUS1.purchaseSharePrice = 2.30;
        stockUS1.currentSharePrice = 4.50;
        
        ZGCForeignStockHolding *stockUS2 = [[ZGCForeignStockHolding alloc] init];
        stockUS2.symbol = @"BNNE";
        stockUS2.numberOfShares = 90;
        stockUS2.purchaseSharePrice = 12.19;
        stockUS2.currentSharePrice = 15.56;
        
        // Two Foreign stock instances
        
        ZGCForeignStockHolding *stockUK = [[ZGCForeignStockHolding alloc] init];
        stockUK.symbol = @"UKLN";
        stockUK.numberOfShares = 10;  // subclass can use variables from its SuperClass
        stockUK.purchaseSharePrice = 1.50;
        stockUK.currentSharePrice = 6.00;
        stockUK.conversionRate = 2.50; // new property via new subclass
        
        ZGCForeignStockHolding *stockCH = [[ZGCForeignStockHolding alloc] init];
        stockCH.symbol = @"CHPN";
        stockCH.numberOfShares = 10;  // subclass can use variables from its SuperClass
        stockCH.purchaseSharePrice = 2.50;
        stockCH.currentSharePrice = 5.00;
        stockCH.conversionRate = 4.50; // new property via new subclass
        
        
        // One Portfolio instance
        ZGCPortfolio *myPortfolio = [[ZGCPortfolio alloc] init];
        
        /******* USING SINGLE LINE APPROACH BELOW INSTEAD *******
        //Build an array
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        [stockUS1 addToStocks:stocks];
        [stockUS2 addToStocks:stocks];
        [stockUK addToStocks:stocks]; // it can use methods from SuperClass too
        [stockCH addToStocks:stocks];
        myPortfolio.holdings = stocks; // set holdings for porfolio
        ***************************/
        
        /********* USING new method for adding holdings
        // set holdings for portfolio
         myPortfolio.holdings = [[NSMutableArray alloc] initWithObjects:stockUS1, stockUS2, stockUK, stockCH, nil];
        **************/
        [myPortfolio addHoldings:stockUS1]; // add holding method
        [myPortfolio addHoldings:stockUS2];
        [myPortfolio addHoldings:stockUK];
        [myPortfolio addHoldings:stockCH];
        
        
    /***** switched to a Descriptiopn method instead of array iteration
        // pull Currency locale information
        NSLocale *userLocale = [NSLocale currentLocale];
        NSString *currencyCode = [userLocale objectForKey:NSLocaleCurrencyCode];
        NSString *currencySym = [userLocale objectForKey:NSLocaleCurrencySymbol];
        
        NSLog(@"Your current Currency: (%@) %@", currencySym, currencyCode);
        
        // Iterate over array
        for (ZGCForeignStockHolding *s in myPortfolio.holdings) { // using fast enum loop for arrays
            float cost = [s costInDollars];
            float value = [s valueInDollars];
            if ([currencySym isEqualTo:@"$"]) {
                s.conversionRate = 0;
            }else{
                NSLog(@"Your conversion rate from %@ to USD: %.2f", currencyCode, s.conversionRate);
            }

            NSLog(@"You paid $%.2fUSD for %d shares of %@, now valued at $%.2fUSD", cost, [s numberOfShares], [s symbol], value);
            
            
            
        } */
        // NSLog(@"%@", myPortfolio.holdings); //uses description method for ZCGForeignHolding object
        NSLog(@"My Holdings: %@", [myPortfolio getHoldings]);
        NSLog(@"%@", myPortfolio); //uses description method for portfolio
        NSLog(@"Top 3 Holdings: %@", [myPortfolio topThreeHoldings]);
        
        // remove a stock from portfolio using new method
        NSLog(@"Removing an asset...\n\n");
        sleep(3);
        
        [myPortfolio removeHoldings:stockUS2]; //remove holding method
        NSLog(@"%@", myPortfolio);
        

    }
    sleep(100);
    return 0;
}
