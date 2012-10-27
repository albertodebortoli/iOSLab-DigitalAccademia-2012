//
//  DAAppDelegate.m
//  Cocoa-ViewControllers
//
//  Created by iOSLab on 7/10/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "DAAppDelegate.h"

#import "DAFirstViewController.h"
#import "DASecondViewController.h"

@implementation DAAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    // create 2 view controllers
    DAFirstViewController *firstViewController = [[DAFirstViewController alloc] initWithNibName:@"DAFirstViewController" bundle:nil];
    DASecondViewController *secondViewController = [[DASecondViewController alloc] initWithNibName:@"DASecondViewController" bundle:nil];
    
    // create 2 nvigation controllers with the previous view controllers as root
    UINavigationController *firstNavigationController = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    UINavigationController *secondNavigationController = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    // release the 2 view controllers, retained now from the navigation controllers
    [firstViewController release];
    [secondViewController release];
    
    // set the tab item title for the navigation controllers
    firstNavigationController.tabBarItem.title = @"First";
    secondNavigationController.tabBarItem.title = @"Second";
    
    // set the title for the 2 view controllers (it is shown in the navigation bar)
    firstViewController.title = @"First!";
    secondViewController.title = @"Second!";
    
    // create the tabbar controller to present the 2 navigation controllers
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = [NSArray arrayWithObjects:firstNavigationController, secondNavigationController, nil];
    //tabBarController.viewControllers = @[firstNavigationController, secondNavigationController];
    // release the 2 navigation controllers, retained now from the tabbar controller
    [firstNavigationController release];
    [secondNavigationController release];
    
    self.window.rootViewController = tabBarController;
    [tabBarController release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
