//
//  Ingredient.m
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAIngredient.h"

#define kShortNameLength 3

@implementation DAIngredient

@synthesize name = _name;
@synthesize quantity = _quantity;
@synthesize price = _price;
@synthesize shortName;

- (id)initWithDictionary:(NSDictionary*) dict 
{
    if (self = [super init]) {
        _name = dict[@"Name"];
        _quantity = [(NSNumber*)dict[@"Quantity"] integerValue];
        _price = [(NSNumber*)dict[@"Price"] floatValue];
    }
    return self;
}

- (void)setQuantity:(NSInteger)quantity
{
    if (quantity != _quantity) {
        _quantity = quantity;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ingredientQuantity" object:self];
    }
}

- (void)decreaseQuantity 
{
    if (self.quantity) {
        self.quantity--;
    }
}

- (void)increaseQuantity 
{
    self.quantity++;
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"INGREDIENT - Name: %@ (%@), quantity: %d, price: %.2f euro", self.name, self.shortName, self.quantity, self.price];
}


- (NSString*)shortName 
{
    if ([self.name length] > kShortNameLength) {
        return [NSString stringWithFormat:@"%@.", [self.name substringToIndex:kShortNameLength]];
    } else {
        return shortName;
    }
}


@end
