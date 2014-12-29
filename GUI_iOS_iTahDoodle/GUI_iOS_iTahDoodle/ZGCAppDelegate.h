//
//  AppDelegate.h
//  GUI_iOS_iTahDoodle
//
//  Created by EvilKernel on 12/27/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZGCAppDelegate : UIResponder <UIApplicationDelegate>

#pragma mark - UI properties / objects
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

#pragma mark - Model properties / objects
@property (nonatomic) NSMutableArray *tasks;

#pragma mark -  method
- (void)addTask:(id)sender;



@end

