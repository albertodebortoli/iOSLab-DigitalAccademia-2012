//
//  DAObject.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 10/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAObject.h"

@implementation DAObject

- (void) log 
{ 
    NSLog(@"%@: %@", NSStringFromClass([self class]), self);
}


@end
