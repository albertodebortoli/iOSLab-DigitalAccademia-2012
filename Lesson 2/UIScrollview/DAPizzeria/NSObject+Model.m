//
//  NSObject+Model.m
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "NSObject+Model.h"
#import "DAAppDelegate.h"

@implementation NSObject (Model)

- (DAModel *)sharedModel 
{
    DAModel *model = ((DAAppDelegate *)[UIApplication sharedApplication].delegate).model;
    return model;
}

@end
