//
//  Menu.h
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DAPizza.h"
#import "DAFridge.h"

@interface DAMenu : NSObject {    
    NSArray *_pizzas;
}

@property (nonatomic, strong) NSArray *pizzas;

- (id)initFromFilesystemAndFridge:(DAFridge *)fridge;

@end
