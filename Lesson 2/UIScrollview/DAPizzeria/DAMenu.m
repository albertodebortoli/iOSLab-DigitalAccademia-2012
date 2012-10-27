//
//  Menu.m
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAMenu.h"

#define kPizzaFilenameAndPLISTRoot @"Menu"

@implementation DAMenu

@synthesize pizzas = _pizzas;

- (id)initFromFilesystemAndFridge:(DAFridge*)fridge 
{
    if ([super init]) {
        
        NSMutableArray* tempPizzas = [[NSMutableArray alloc] init];
        
        NSString* filePath = [[NSBundle mainBundle] pathForResource:kPizzaFilenameAndPLISTRoot ofType:@"plist"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        NSArray *arr = [dict objectForKey:kPizzaFilenameAndPLISTRoot];
        
        for (NSDictionary* pizzaDict in arr) {
            DAPizza *pizza = [[DAPizza alloc] initWithDictionary:pizzaDict andFridge:fridge];
            [tempPizzas addObject:pizza];
        }
        
        self.pizzas = [NSArray arrayWithArray:tempPizzas];
    }
    
    return self;    
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"MENU - I have %d pizzas: %@", [self.pizzas count], self.pizzas];
}

@end
