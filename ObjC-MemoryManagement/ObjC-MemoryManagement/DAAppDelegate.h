//
//  DAAppDelegate.h
//  ObjC-MemoryManagement
//
//  Created by Alberto De Bortoli on 30/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAViewController;


@interface DAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DAViewController *viewController;

+ (void)logRetainCountForObject:(id)obj withName:(NSString *)name;

@end
