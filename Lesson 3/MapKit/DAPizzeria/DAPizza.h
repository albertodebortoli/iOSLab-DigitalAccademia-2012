//
//  Pizza.h
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DAFridge.h"

@interface DAPizza : NSObject {
    
    NSString    *_name;
    NSString    *_imgPath;	
    NSString    *_description;
    NSSet       *_ingredients;
    CGFloat     _basePrice;
}

@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) NSString  *desc;
@property (nonatomic, strong) NSString  *imgPath;
@property (nonatomic, strong) NSSet     *ingredients;
@property (nonatomic, assign) CGFloat   basePrice;

- (id)initWithDictionary:(NSDictionary *) dict andFridge:(DAFridge *)fridge;
- (UIImage *)image;
- (CGFloat)price;
- (bool)canBeOrdered;
- (void)buy;

@end
