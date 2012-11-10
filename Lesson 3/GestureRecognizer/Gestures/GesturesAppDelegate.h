//
//  GesturesAppDelegate.h
//  Gestures

#import <UIKit/UIKit.h>

@class GesturesViewController;

@interface GesturesAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet GesturesViewController *viewController;

@end
