//
//  DAData.m
//  iOS-Debugging
//
//  Created by Alberto De Bortoli on 25/09/10.
//  Copyright 2010 iHarmony, Inc. All rights reserved.
//

#import "DAData.h"

static DAData *shared = nil;


@implementation DAData

#pragma mark - class methods

+ (DAData *)sharedInstance
{
    @synchronized (self) {
        if (!shared) {
            shared = [[super allocWithZone:NULL] init];
        }
    }
    return shared;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

#pragma mark - instance methods

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (oneway void)release
{
    // do nothing
}

- (id)autorelease
{
    return self;    
}

- (id)init
{
    self = [super init];
    if (self) {
        NSString *pathBundle = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        self->db = [[NSDictionary alloc] initWithContentsOfFile:pathBundle];
    }
    
    return self;
}

- (NSArray *)numbers
{
    return [db objectForKey:@"Numbers"];
}

@end
