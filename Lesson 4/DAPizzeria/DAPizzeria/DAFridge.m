//
//  Fridge.m
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAFridge.h"

#define kFridgeFilenameAndPLISTRoot @"Fridge"

@implementation DAFridge 

@synthesize ingredients = _ingredients;

- (id)initFromFilesystem 
{
    if (self = [super init]) {
        NSMutableArray* tempIngredients = [[NSMutableArray alloc] init];
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:kFridgeFilenameAndPLISTRoot ofType:@"plist"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
        NSArray *arr = dict[kFridgeFilenameAndPLISTRoot];
        
    
        for (NSDictionary* ingredientDict in arr) {
            DAIngredient *ingredient = [[DAIngredient alloc] initWithDictionary:ingredientDict];
            [tempIngredients addObject:ingredient];
        }
        
        _ingredients = [NSArray arrayWithArray:tempIngredients];
    }
    return self;    
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"FRIDGE - I have %d ingredients: %@", [self.ingredients count], self.ingredients];
}

- (DAIngredient*)ingredientByName:(NSString*)name 
{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name = %@", name];
    
    NSArray *matching = [self.ingredients filteredArrayUsingPredicate:pred];
    if ([matching count]) {
        return matching[0];
    }
    else {
        return  nil;
    }   
    
}

- (NSArray*)allIngredients 
{
    NSArray *all = [NSArray arrayWithArray:self.ingredients];
    return  all;
}


- (NSInteger) countOfIngredients {
    return [self.ingredients count];
}

- (DAIngredient*)ingredientAtIndexPath:(NSIndexPath*)path 
{
    if (path.row < [self countOfIngredients]) {
        return (DAIngredient*)(self.ingredients)[path.row];
    }
    else {
        return nil;
    }
}

    
@end
