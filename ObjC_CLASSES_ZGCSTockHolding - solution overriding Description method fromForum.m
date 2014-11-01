/*
Key-concept to answer challenge 20 is about "%@" or description...

by overriding description method on Base and Sub-Class we can easily fast enumerating through array, which each object can describe itself.

then, all we do is call it in main like so:  NSLog(@"%@", s);   as we iterate through the aray with fast enum
*/

// BNRStockHolding.m //
- (NSString *)description
{
    
    NSString *objectDescriptionFormat = @"\n" "========= Properties of Stock Value %@ ==========\n"
    "Purchase price is %f\n" "Current Price is %f\n" "Number of Shares bought is %i\n" "\n"
    "------------------- Total Value & Cost ------------------\n"
    "Value in dollar for this stock is %f\n" "Cost in dollar for this stock is %f\n" "\n";
    
    return [NSString stringWithFormat:objectDescriptionFormat, [super description],self.purchaseSharePrice,self.currentSharePrice,self.numberOfShares,self.valueInDollars,self.costInDollars];
}

// BNRForeignStockHolding.m //
- (NSString *)description
{
    NSString *objectDescriptionFormat = @"%@" "Conversion rate for this stock is %f\n"  "\n" ;   
    return [NSString stringWithFormat: objectDescriptionFormat,[super description],self.conversionRate];
}