//
//  DAAppDelegate.h
//  Cocoa-WebBrowser
//
//  Created by iOSLab on 7/11/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAViewController;

@interface DAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DAViewController *viewController;

@end
