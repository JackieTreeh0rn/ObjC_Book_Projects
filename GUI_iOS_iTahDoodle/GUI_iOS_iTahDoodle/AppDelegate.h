//
//  AppDelegate.h
//  GUI_iOS_iTahDoodle
//
//  Created by EvilKernel on 12/27/14.
//  Copyright (c) 2014 Zerogravity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;
@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id)sender;



@end

