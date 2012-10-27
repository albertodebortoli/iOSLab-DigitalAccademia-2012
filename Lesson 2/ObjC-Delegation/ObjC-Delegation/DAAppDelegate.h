//
//  DAAppDelegate.h
//  ObjC-Delegation
//
//  Created by Alberto De Bortoli on 7/4/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAViewController;

@interface DAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DAViewController *viewController;

@end
