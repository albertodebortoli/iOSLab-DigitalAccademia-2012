//
//  DAAppDelegate.h
//  iOS-Debugging
//
//  Created by Alberto De Bortoli on 7/17/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DANumberListViewController;

@interface DAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DANumberListViewController *viewController;

@end
