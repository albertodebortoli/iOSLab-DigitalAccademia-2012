//
//  DAAppDelegate.m
//  ObjC-MemoryManagement
//
//  Created by Alberto De Bortoli on 30/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DAAppDelegate.h"

#import "DAViewController.h"
#import "DAPerson.h"

@implementation DAAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

+ (void)logRetainCountForObject:(id)obj withName:(NSString *)name
{
    NSLog(@"var %@: obj of class %@ has memory address %p and retain count of %d", name, NSStringFromClass([obj class]), obj, [obj retainCount]);
}

- (void)doSomeMemoryManagementExercises
{
     // object stuff
    DAPerson *person1 = [DAPerson alloc];
    [DAAppDelegate logRetainCountForObject:person1 withName:@"person1"];
    
    person1 = [person1 initWithName:@"Enrico" birthDate:nil sex:kDASexUnknown];
    [[self class] logRetainCountForObject:person1 withName:@"person1"];
    
    NSLog(@"%@", [person1 cardInfo]);
    
    [person1 retain];
    [[self class] logRetainCountForObject:person1 withName:@"person1"];
    [person1 release];
    [[self class] logRetainCountForObject:person1 withName:@"person1"];
    
    NSLog(@" -- ");
    
    // factory method
    DAPerson *person2 = [DAPerson createAPerson];
    [[self class] logRetainCountForObject:person2 withName:@"person2"];
    //[person2 release];
    
    DAPerson *person3 = [person2 copy];
    [[self class] logRetainCountForObject:person3 withName:@"person3"];
    [person3 release];
    
    // array stuff
    NSArray *array1 = [[NSArray alloc] initWithObjects:person1, person2, nil];
    NSLog(@" -- log after insertion into array -- ");
    [[self class] logRetainCountForObject:array1 withName:@"array1"];
    [[self class] logRetainCountForObject:person1 withName:@"person1"];
    [[self class] logRetainCountForObject:person2 withName:@"person2"];
    
    [array1 release];
    
    NSLog(@" -- log after the destruction of the array -- ");
    [[self class] logRetainCountForObject:person1 withName:@"person1"];
    [[self class] logRetainCountForObject:person2 withName:@"person2"];

    [person1 release];
    
    NSLog(@" -- ");
    
    // strings are symbols
    NSString *string1 = [[NSString alloc] initWithString:@"String"];
    [[self class] logRetainCountForObject:string1 withName:@"string1"];
    [string1 retain];
    [[self class] logRetainCountForObject:string1 withName:@"string1"];
    [string1 release];
    [[self class] logRetainCountForObject:string1 withName:@"string1"];
    [string1 release];
}

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
    self.viewController = [[[DAViewController alloc] initWithNibName:@"DAViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [self doSomeMemoryManagementExercises];
    
    return YES;
}

@end
