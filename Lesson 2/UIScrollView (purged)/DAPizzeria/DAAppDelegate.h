//
//  DAAppDelegate.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 05/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAModel.h"

@class DAFridgeViewController;

@interface DAAppDelegate : UIResponder <UIApplicationDelegate> {
    DAModel *_model;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) DAModel *model;


@end
