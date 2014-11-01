//
//  main.m
//  ObjC_MyFirst_CLASS_ZGCPerson_time_using_Properties
//
//  Created by EvilKernel on 9/29/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h> //angled brackets tells the compiler that Foundation.h is a precompiled header found in the apple libs

// #import "ZGCPerson.h" //importing my first class - ZGCPerson.  The quotation marks tell compiler to look for header within current project

#import "ZGCEmployee.h" //importing subclass header only - superclass header already imported in subclass's header
#import "ZGCAsset.h" // importing header for asset class.

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {

        // Create an array of 10 ZGCEmployee objects
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        // Create dictionary of executives (like arrays but with key-value pairs
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < 10; i++) {
            ZGCEmployee *myEmployee = [[ZGCEmployee alloc] init];
            
            // Give the instance variables interesting values
            myEmployee.weightInKilos = 90 + i;
            myEmployee.heightInMeters = 1.8 - i/10.0;
            myEmployee.employeeID = i;
            myEmployee.hireDate = [NSDate dateWithNaturalLanguageString:@"January 6th, 2003"];

            
            // Put the employees in the employee array
            [employees addObject:myEmployee];
            
            // build dictionary
            if (i == 0) {
                [executives setObject:myEmployee //addint item to dict.
                               forKey:@"CEO"];
            }
            if (i == 1){
                [executives setObject:myEmployee //adding item to dict.
                               forKey:@"CTO"];
            }

        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        // Create 10 assets objects
        for (int i = 0; i < 10; i++) {
            ZGCAsset *asset = [[ZGCAsset alloc] init];
            
            // Give them  interesting labels and resale values
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i * 17;
        
            // Get a random number (employee) between 0 and 9 inclusive (based on array count)
            NSUInteger randomIndex = random() % [employees count];
            
            // Find that employee
            ZGCEmployee *randomEmployee = [employees objectAtIndex:randomIndex]; //avioding subscripting / easy toread

            //Assign the asset to the employee  
            [randomEmployee addAsset:asset]; // this method creates a mutable array (_assets) if it doesnt exist and adds asset to it - each employee object gets an array object of assets.
            
            [allAssets addObject:asset];
            
        }
        
        // SORTING // - using sort descriptors (NSSortDescriptor)
        // defining sort descriptors first (two in this case)
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];
        // apply sorting to array (sortUsingDescriptor method expects array of NSSortDescriptprs)
        [employees sortUsingDescriptors:@[voa, eid]];
        
        // output sorted array
        NSLog(@"Employees: %@", employees); // uses overwritten description method in zgemployee.m
        //sleep(3);
        
        NSLog(@"Executives: %@", executives); // log entire dict
        NSLog(@"CTO: %@", executives[@"CTO"]); // log specific dict. key
        executives = nil;
        
        
        // FILTERING // when filtering a collection, you compare its objects to a logical statement to get a resultant collection that only contains objects for which the statement ist true - using NSPredicate.  A predicate contains a statement that might be true.
        // Filtering for employees wgi currently hold assets worth more tha $70.00 total, to reclaim them.
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"]; //define predicate
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate]; //building new NSArray
        NSLog(@"Assets to be Reclaimed: %@", toBeReclaimed);
        toBeReclaimed = nil;
        
        
        
        NSLog(@"------Giving up ownership of one employee------");
        [employees removeObjectAtIndex:5]; // invokes ovewritten dealloc() method in the class for illustration.
       // sleep(3);
        
        NSLog(@"All Assets:%@", allAssets);
        
        
        NSLog(@"------Removing an asset from a random employee------");
            // Get a random number employee from what is left in the employee array
            NSUInteger randomIndex = random() % [employees count];
            ZGCEmployee *randomEmployee = [employees objectAtIndex:randomIndex];
        
            // iterate up to # of remaining assets to avoid NSException.
        for (ZGCAsset *a in randomEmployee.assets) {
            [randomEmployee removeAsset:a]; // method to remove an asset
            
            NSLog(@"Removed %@", a);
            
        }
        //sleep(5);
         NSLog(@"All Assets:%@", allAssets);
        
        
        NSLog(@"------Giving up ownership of arrays------");
        allAssets = nil;
        employees = nil; // invokes overwritten dealloc() method in the class object for illustration
        //sleep(3);
        
    }
    sleep(100); // adding a sleep for
    return 0;
}

