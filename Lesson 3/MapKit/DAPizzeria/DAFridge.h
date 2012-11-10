//
//  Fridge.h
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DAIngredient.h"

@interface DAFridge : DAObject {
    
    NSArray *_ingredients;
}

@property (nonatomic, strong) NSArray *ingredients;

- (id)initFromFilesystem;
- (DAIngredient*)ingredientByName:(NSString*)name;
- (NSArray*)allIngredients;
- (NSInteger) countOfIngredients;
- (DAIngredient*)ingredientAtIndexPath:(NSIndexPath*)indexPath;

// fat models, skinny controllers

@end
