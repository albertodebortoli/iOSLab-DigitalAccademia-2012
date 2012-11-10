//
//  DAAppDelegate.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 05/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAAppDelegate.h"

#import "DAFridgeViewController.h"
#import "DACounterViewController.h"
#import "DABrowserViewController.h"
#import "DAMenuViewController.h"
#import "DAMapViewController.h"

#define kStartingURL @"http://ioslabdigitalaccademia.wordpress.com/"

@implementation DAAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize model = _model;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.model = [[DAModel alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    NSLog(@"%@", self.model);
    
    
    // Creo il viewcontroller per il menu
    UIViewController *menuViewController = [[DAMenuViewController alloc] initWithNibName:@"DAMenuViewController" bundle:nil];
    UIImage *menuImage = [UIImage imageNamed:@"speaker"];
    UITabBarItem *menuTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Menu" image:menuImage tag:0];
    menuViewController.tabBarItem = menuTabBarItem;
    
    
    // Creo il navigation controller per il navigator
    
    NSURLRequest *browserUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:kStartingURL]];
    
    DABrowserViewController *browserViewController = [[DABrowserViewController alloc] initWithNibName:@"DABrowserViewController" bundle:nil urlRequest:browserUrlRequest];
    
    UINavigationController *browserNavController = [[UINavigationController alloc] initWithRootViewController:browserViewController];
    UIImage *browserImage = [UIImage imageNamed:@"rss"];
    
    UITabBarItem *browserTabBarItem = [[UITabBarItem alloc] initWithTitle:@"iOS Lab" image:browserImage tag:0];    
    browserNavController.tabBarItem = browserTabBarItem;
    
    
    // Creo il navigation controller per il frigo
    DAFridgeViewController *fridgeViewController = [[DAFridgeViewController alloc] initWithNibName:@"DAFridgeViewController" bundle:nil];

    UINavigationController *fridgeNavController = [[UINavigationController alloc] initWithRootViewController:fridgeViewController];
    UIImage *fridgeImage = [UIImage imageNamed:@"trolley"];
    
    UITabBarItem *fridgeTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Fridge" image:fridgeImage tag:0];    
    fridgeNavController.tabBarItem = fridgeTabBarItem;
    
    
    // Creo il controller per la cassa
    DACounterViewController *counterViewController = [[DACounterViewController alloc] initWithNibName:@"DACounterViewController" bundle:nil];
    UIImage *counterImage = [UIImage imageNamed:@"piggy_bank"];
    UITabBarItem *counterTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Counter" image:counterImage tag:1];
    counterViewController.tabBarItem = counterTabBarItem;
    
    
    // Creo il controller per la mappa
    DAMapViewController *mapViewController = [[DAMapViewController alloc] initWithNibName:@"DAMapViewController" bundle:nil];
    UIImage *mapImage = [UIImage imageNamed:@"globe"];
    UITabBarItem *mapTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:mapImage
                                                                   tag:1];
    mapViewController.tabBarItem = mapTabBarItem;
    
    

    // creo il tabbar controller
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    tabbar.viewControllers = [NSArray arrayWithObjects:menuViewController, fridgeNavController, counterViewController, browserNavController, mapViewController, nil];

    self.tabBarController = tabbar;
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    
    
    /*
    Prendere spunto dal codice seguente per copiare il file nella documents directory
     
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentDBFolderPath = [documentsDirectory stringByAppendingPathComponent:@"Library"];
    
    NSString *resourceDBFolderPath = [[[NSBundle mainBundle] resourcePath]
                                      stringByAppendingPathComponent:@"SampleImages"];
    [fileManager copyItemAtPath:resourceDBFolderPath toPath:documentDBFolderPath error:&error];
    
    */
    
    
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end