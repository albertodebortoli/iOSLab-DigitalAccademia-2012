//
//  Model.m
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAModel.h"

@implementation DAModel

@synthesize fridge = _fridge;
@synthesize counter = _counter;
@synthesize menu = _menu;

- (id)init 
{
    if (self = [super init]) {
        _fridge = [[DAFridge alloc] initFromFilesystem];
        _counter = [[DACounter alloc] init];
        _menu = [[DAMenu alloc] initFromFilesystemAndFridge:_fridge];
    }
    return self;    
}

- (NSString*)description 
{
    return [NSString stringWithFormat:@"MODEL\n%@, %@, %@", self.fridge, self.counter, self.menu];
}


@end
