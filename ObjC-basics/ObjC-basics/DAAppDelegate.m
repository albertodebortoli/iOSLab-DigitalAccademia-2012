//
//  DAAppDelegate.m
//  ObjC-basics
//
//  Created by Alberto De Bortoli on 30/06/12.
//  Copyright (c) 2012 iOSLab. All rights reserved.
//

#import "DAAppDelegate.h"

#import "DAViewController.h"
#import "DAPerson.h"

@implementation DAAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

+ (BOOL)doSomeObjCBasicExercises
{
    // string stuff
    NSString *string1 = @"Enrico";
    NSString *string2 = [NSString stringWithString:@"Enrico"];
    NSString *string3 = [[NSString alloc] initWithString:@"Enrico"];
    NSString *string4 = [NSString stringWithFormat:@"%@%@", @"En", @"rico"];
    
    NSLog(@"%@, %@, %@, %@", string1, string2, string3, string4);
    NSLog(@"%p, %p, %p, %p", string1, string2, string3, string4);
    
    
    // number stuff
    NSNumber *number1 = [NSNumber numberWithInt:3];
    NSNumber *number2 = [[NSNumber alloc] initWithInt:3];
    NSNumber *number3 = [NSNumber numberWithFloat:3.2];
    NSNumber *number4 = [NSNumber numberWithBool:YES];
    
    NSLog(@"%@, %@, %@, %@", number1, number2, number3, number4);
    NSLog(@"%p, %p, %p, %p", number1, number2, number3, number4);
    
    NSInteger integer1 = [number1 integerValue];
    NSInteger integer2 = [number2 integerValue];
    CGFloat   float1   = [number3 floatValue];
    BOOL      bool1    = [number4 boolValue];
    
    NSLog(@"%d, %d, %f, %d", integer1, integer2, float1, bool1);
    
    
    // array stuff
    NSArray *array1 = [NSArray arrayWithObjects:string1, string2, string3, string4, nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:number1, number2, number3, number4, nil];
    
    NSLog(@"array1: %@", array1);
    NSLog(@"array2: %@", array2);
    
    
    // mutable array stuff
    NSMutableArray *mutableArray1 = [NSMutableArray arrayWithObjects:string1, string2, nil];
    NSMutableArray *mutableArray2 = [[NSMutableArray alloc] initWithObjects:number1, number2, nil];
    
    [mutableArray1 addObject:string3];
    [mutableArray1 addObject:string4];
    [mutableArray2 addObject:number3];
    [mutableArray2 addObject:number4];
    
    NSLog(@"mutableArray1: %@", mutableArray1);
    NSLog(@"mutableArray2: %@", mutableArray2);
    
    
    // dictionary stuff
    NSDictionary *dictionary1 = [NSDictionary dictionaryWithObjectsAndKeys:array1, @"key1", array2, @"key2", nil];
    NSDictionary *dictionary2 = [[NSDictionary alloc] initWithObjectsAndKeys:array1, @"key1", array2, @"key2", nil];
    
    NSLog(@"dictionary1: %@", dictionary1);
    NSLog(@"dictionary2: %@", dictionary2);
    
    
    // mutable dictionary stuff
    NSMutableDictionary *mutableDictionary1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:array1, @"key1", nil];
    NSMutableDictionary *mutableDictionary2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:array2, @"key2", nil];
    
    [mutableDictionary1 setObject:array2 forKey:@"key2"];
    [mutableDictionary2 setObject:array1 forKey:@"key1"];
    
    NSLog(@"mutableDictionary1: %@", mutableDictionary1);
    NSLog(@"mutableDictionary2: %@", mutableDictionary2);
    
    [mutableDictionary1 removeObjectForKey:@"key1"];
    [mutableDictionary2 removeObjectForKey:@"key2"];
    
    NSLog(@"mutableDictionary1: %@", mutableDictionary1);
    NSLog(@"mutableDictionary2: %@", mutableDictionary2);
    
    
    // loop stuff
    for (int i = 0; i < [array1 count]; i++) {
        NSLog(@"array1 object at index %d: %@", i, [array1 objectAtIndex:i]);
    }
    
    for (NSString *key in dictionary1) {
        NSLog(@"dictionary1 object for key %@: %@", key, [dictionary1 objectForKey:key]);
    }
    
    
    // method stuff
    NSString *uppercaseString1 = [string1 uppercaseString];
    NSLog(@"uppercaseString1: %@", uppercaseString1);
    
    string1 = nil;
    NSString *uppercaseString2 = [string1 uppercaseString];
    NSLog(@"uppercaseString2: %@", uppercaseString2);
    
    
    // object stuff
    DAPerson *person1 = [[DAPerson alloc] initWithName:@"Zeff" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person2 = [[DAPerson alloc] initWithName:@"Wolf" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person3 = [[DAPerson alloc] initWithName:@"Debo" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person4 = [[DAPerson alloc] initWithName:@"Valentina" birthDate:[NSDate date] sex:kDASexFemale];
    
    NSArray *arrayWithPersons = [NSArray arrayWithObjects:person1, person2, person3, person4, nil];
    
    for (DAPerson *person in arrayWithPersons) {
        NSLog(@"%@", [person cardInfo]);
    }
    
    return YES;
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
    
    BOOL retVal = [[self class] doSomeObjCBasicExercises];
    
    return retVal;
}

@end
