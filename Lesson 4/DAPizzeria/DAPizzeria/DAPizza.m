//
//  Pizza.m
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAPizza.h"
#import "NSObject+Model.h"

@implementation DAPizza 
    
@synthesize name = _name;
@synthesize basePrice = _basePrice;
@synthesize desc = _description;
@synthesize imgPath = _imgPath;
@synthesize ingredients = _ingredients;

- (id)initWithDictionary:(NSDictionary *)dict andFridge:(DAFridge *)fridge 
{
    self = [super init];
    if (self) {
        
        self.name = dict[@"Name"];
        self.desc = dict[@"Description"];
        self.basePrice = [(NSNumber*)dict[@"BasePrice"] floatValue];
        self.imgPath = [[NSBundle mainBundle] pathForResource:dict[@"ImagePath"] ofType:@"jpg"];
        
        
        NSMutableArray *tempIngredients = [[NSMutableArray alloc] init];
        for (NSString *ingredientName in dict[@"Ingredients"]) {
            DAIngredient *i = [fridge ingredientByName:ingredientName];
            if (i) {
                [tempIngredients addObject:i];
            }
            else {
                NSLog(@"cannot find %@", ingredientName);
            }
        }
        
        self.ingredients = [NSSet setWithArray:tempIngredients];
    }
    return self;
}

- (NSString *)description 
{
    NSMutableString *prettyIngredients = [NSMutableString stringWithString:@""];
    for (DAIngredient *i in self.ingredients) {
        [prettyIngredients appendFormat:@"%@,", i.name];
    }
    
    return [NSString stringWithFormat:@"PIZZA - Name: %@, description: %@, basePrice: %.2f euro, %d ingredients: %@ price: %.2f euro", self.name, self.desc, self.basePrice, [self.ingredients count], prettyIngredients, [self price]];
}

- (UIImage*)image 
{
    return [UIImage imageWithContentsOfFile:self.imgPath];
}

- (CGFloat)price 
{
    CGFloat result = self.basePrice;
    for (DAIngredient *i in self.ingredients) {
        result += i.price;
    }
    return result;
}

- (bool)canBeOrdered 
{
    for (DAIngredient *i in self.ingredients) {
        if (i.quantity == 0) return NO;
    }
    return YES;
}

- (void)buy
{
    if ([self canBeOrdered]) {
        for (DAIngredient *i in self.ingredients) {
            i.quantity--;
        }
    }
    [[self sharedModel].counter deposit:[self price]];
}


@end
