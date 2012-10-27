//
//  Ingredient.h
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAObject.h"

@interface DAIngredient : DAObject {
    
    NSString *_name;
    NSInteger _quantity;
    CGFloat _price;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger quantity;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, strong) NSString *shortName;

- (id) initWithDictionary:(NSDictionary *) dict;
- (void)decreaseQuantity; 
- (void)increaseQuantity;

@end
