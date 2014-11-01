//
//  main.m
//  ObjC_NSArray|NSRange_interesting_names_Challenge
//
//  Created by EvilKernel on 9/11/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // **** INTERESTING NAMES CHALLENGE - NSARRAY - Locate lower case name [only] matches in words file **** //
        
        // Read in file inputs and build giant strings with file
        NSString *namesFile = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames" encoding:NSUTF8StringEncoding error:NULL];
        NSString *wordsFile = [NSString stringWithContentsOfFile:@"/usr/share/dict/words" encoding:NSUTF8StringEncoding error:NULL];
        
        // build arrays, breaking down the lumped strings above into an array of strings so that we can compare one by one string item.
        NSArray *names = [namesFile componentsSeparatedByString:@"\n"]; // method of NSString which returns an array with items from above string + separator, in this case, a line break.
        NSArray *words = [wordsFile componentsSeparatedByString:@"\n"];
        
        
        // Use int variable to track # of name/word matches.
        // For each name in name array, iterate through words array.
        // If the word and name are the same on case-insensitive basis
        // and the word isn't a duplicate of the uppercase name
        // increment match variable, then print the name and the word as a valid match.
        int i = 0;
        for (NSString *w in words){ //using fast enumeration for loop (fast enum avaiable for arrays)
            for (NSString *n in names) {
                
                // search for equivalent 'name string' in 'words' that is lower case.
                NSComparisonResult match = [w localizedCaseInsensitiveCompare:n]; // could do straight "if (w localizedCaseInsensitiveCompare:n == NSOrderedSame
                BOOL isMatch = match == NSOrderedSame && ![w isEqualToString:n]; //could also use && [w isEqualToString:n.lowercaseString]
                if (isMatch) {
                    i++; //increment log count
                    NSLog (@"%d.Match Found %@ ----------- %@", i, n, w);
                    break;
                }
            }
        }
        
        NSLog(@"Processed %lu name againts %lu words with %d matches found", names.count, words.count, i);
        
    }
    return 0;
    
}