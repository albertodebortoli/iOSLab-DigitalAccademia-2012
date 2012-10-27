//
//  DAAppDelegate.h
//  UIViewExample
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 Enrico Zeffiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAViewController;

@interface DAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DAViewController *viewController;

@end
