#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Turn lists of names and words into strings
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        // Split up names and words and put them into arrays
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        NSArray *words = [wordString componentsSeparatedByString:@"\n"];
        
        // Use int variable to track name/word matches.
        // For each name in name array, iterate through words array.
        // If the word and name are the same on case-insensitive basis
        // and the word isn't a duplicate of the uppercase name
        // increment match variable, then print the name and the word as a valid match.
        int match = 0;
        for (NSString *n in names) {
            for (NSString *w in words) {
                if (([n caseInsensitiveCompare:w] == NSOrderedSame) && ![n isEqualToString:w]) {
                    match++;
                    NSLog(@"#%i Name: %@  Word: %@", match, n, w);
                }
            }
        }
        
    }
    return 0;
}
