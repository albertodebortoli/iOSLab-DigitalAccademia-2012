//
//  GesturesAppDelegate.m
//  Gestures
//

#import "GesturesAppDelegate.h"

#import "GesturesViewController.h"

@implementation GesturesAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
