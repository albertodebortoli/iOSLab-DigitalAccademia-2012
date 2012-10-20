//
//  DAAppDelegate.h
//  Cocoa-ViewControllers
//
//  Created by iOSLab on 7/10/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAFirstViewController;

@interface DAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DAFirstViewController *viewController;

@end
