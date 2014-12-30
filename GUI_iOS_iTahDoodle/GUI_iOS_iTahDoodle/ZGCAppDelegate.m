//
//  AppDelegate.m
//  GUI_iOS_iTahDoodle
//
//  Created by EvilKernel on 12/27/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import "ZGCAppDelegate.h"

@interface ZGCAppDelegate ()

@end

@implementation ZGCAppDelegate

#pragma mark - Application delegate callbacks


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Create an empty array to get us started
    self.tasks = [NSMutableArray array];
    
    
    // Create and configure the UIWindow instance
    // A CGRect is a struct with an origin (x,y) and a size (width, height)
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    self.window = theWindow;
    
    
    // Define the frame rectangles of the three UI elements
    // CGRectMake() creates a CGRect from (x, y, width, height)
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height - 100);
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
    
    
    // Create and configure the UITableView instance
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    // Tell the table view which class to instantiate whenever it needs to create a new cell
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // * WIRING UP THE TABLE VIEW * //
    // Make the ZGCAppDelegate the TableView's datasource (it must conform to the datasource protocol (has two required methods))
    self.taskTable.dataSource = self;
    
    
    // Create and configure the UITextField instance where new tasks will be entered
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap insert";
    [self.taskField becomeFirstResponder]; // added this to turn text field into first responder control (makes keyboard pop in this case)
    
    
    // Create and configure the UIButton instance
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    // Give the button a title
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    
    // * WIRING UP THE BUTTON * - Set the target-action callback for the insert button //
    [self.insertButton addTarget:self
                          action:@selector(addTask:)
                forControlEvents:UIControlEventTouchUpInside];
    
    
    // Add our three UI elements to the window (subviews)
    [self.window addSubview:self.taskTable];
    [self.window addSubview:self.taskField];
    [self.window addSubview:self.insertButton];
    
    // Finalize the window and put it on the screen
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES; // this is a BOOL method so it must return YES in this case (BOOls default to NO generally)

    
    // REPLACED THIS BOILERPLATE CODE WITH THE ABOVE so that I get to build the GUI programatically instead of via the editor //
    /* self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES; */
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


# pragma mark - Target Actions

- (void)addTask:(id)sender {
    // Get the Task
    NSString *text = [self.taskField text];
    
    // Quit here if taskfield is empty
    if ([text length] == 0) {
        return;
    }
    // Add it to the working array
    [self.tasks addObject:text];
    // Log text to console (for logging purposes)
    NSLog(@"Task entered: %@", text);
    
    // Refresh the table so that the new item shows up
    [self.taskTable reloadData];
    
    
    // Clear out the text field
    [self.taskField setText:@""];
    
    // Dismiss Keyboard
    [self.taskField resignFirstResponder];
}

# pragma mark - Table View Management

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Because this table view only has one section,
    // the number of rows in it is equal to the number
    // of items in the task array
    return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // To improve performance, this method first checks
    // for an existing cell object that we can reuse
    // If there isn't one, then a new cell is created
    UITableViewCell *c = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    // Then we (re)configure the cell based on the model object,
    // in this case the tasks array...
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    
    // ...and hand the property configured cell back to the table view
    return c;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // test // not ready for this yet // // adds a delete button with swipe...  IT WORKS THOUGH!!!
    NSArray *deleteIndexPaths = [NSArray arrayWithObjects:indexPath, nil];
    [tableView beginUpdates]; // could also reference this via the actual instance variable 'self.tasktable'
    [tableView deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    [self.tasks removeObjectAtIndex:indexPath.item];
    [tableView numberOfRowsInSection:[self.tasks count]]; // update table row count after deletion
    [tableView endUpdates];
    [tableView reloadData];
}

@end
