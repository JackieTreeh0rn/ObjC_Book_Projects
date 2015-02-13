//
//  main.m
//  ObjC_ObjectiveC_Runtime-Features
//
//  Created by EvilKernel on 2/13/15.
//  Copyright (c) 2015 Zerogravity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h> //needted to access runtime functions directly

// C Helper function to build an array that holds list of class and superclasses, building a hierchy.
NSArray *ZGCHierarchyForClass(Class cls) {
    NSMutableArray *classHierarchy = [NSMutableArray array];
    // climb up until there is no more superclass
    for (Class c = cls; c != nil; c = class_getSuperclass(c)) {
        NSString *className = NSStringFromClass(c);
        [classHierarchy insertObject:className atIndex:0];
    }
    return classHierarchy; // return hierarchy array
}


// C Helper function to list methods that are impeneted on a given class
NSArray *ZGCMethodsForClass(Class cls) {
    NSMutableArray *methodArray = [NSMutableArray array];
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(cls, &methodCount);
    for (int m = 0; m < methodCount; m++) {
        //get current method
        Method currentMethod = methodList[m];
        //get the selector for the current method
        SEL methodSelector = method_getName(currentMethod);
        //add its strings representation to the array
        [methodArray addObject:NSStringFromSelector(methodSelector)];
    }
    return methodArray; // return method array
}

// C Helper Funtion to list instance variables for each clas
NSArray *ZGCiVarsForClass(Class cls) {
    NSMutableArray *iVars = [NSMutableArray array];
    unsigned int ivarCount = 0;
    Ivar *iVarList = class_copyIvarList(cls, &ivarCount);
    for (int v = 0; v < ivarCount; v++) {
        // get current variable
        Ivar currentIVar = iVarList[v];
        // encode C string name for iVar into an NSString object
        NSString *iVarName = [NSString stringWithCString:ivar_getName(currentIVar) // ivar_getName() function returns a C String.
                                                encoding:NSUTF8StringEncoding];
        
        // add resulting NSString object to iVar array
        [iVars addObject:iVarName];
        
    }
    return iVars; // return ivar array
}

/// MAIN ///
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create an aray of dictionaries, where each ditionary will hold the classname,
        // hierrarchy, and method list for a given class
        NSMutableArray *runtimeClassesInfo = [NSMutableArray array];
        
        
        // record a var to store # of classes
        unsigned int classCount = 0;
        
        // get a pointer to a list of all registered classes loaded by your application (returned by reference)
        Class *classList = objc_copyClassList(&classCount); // returns an array if pointers to class objects and then the count gets passed by reference to the variable above...
        
        // for each class on the list
        for (int i = 0; i < classCount; i++) {
            
            // Treat the classList  as a C array to get a Class from it
            Class currentClass = classList[i];
            
            // Get the class name as a string
            NSString *className = NSStringFromClass(currentClass);
            
            // Log the Class name
            // NSLog(@"%@", className);
            
            // Using our three C helper functions //
            NSArray *hierarchy = ZGCHierarchyForClass(currentClass);
            NSArray *methods = ZGCMethodsForClass(currentClass);
            NSArray *variables = ZGCiVarsForClass(currentClass);
            NSDictionary *classInfoDict = @{ @"classname" : className,
                                            @"hierarchy" : hierarchy,
                                            @"methods" : methods,
                                            @"iVariables" : variables };
            
            [runtimeClassesInfo addObject:classInfoDict];
            
            
        }
        
        // We're done with the class list buffer, so free it
        free(classList); // this is the copy and create rule in objective C. any function that uses 'copy or 'create',like the one we used "objc_copyClassList()", needs freeing
        
        // Sort the ckasses ubfi arrat alphabetically by name
        NSSortDescriptor *alphaAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        NSArray *sortedArray = [runtimeClassesInfo sortedArrayUsingDescriptors:@[alphaAsc]];
        NSLog(@"There  are %ld classses registered with this program's Runtime", sortedArray.count);
        NSLog(@"%@", sortedArray);
                                
        
        
    }
    return 0;
}
