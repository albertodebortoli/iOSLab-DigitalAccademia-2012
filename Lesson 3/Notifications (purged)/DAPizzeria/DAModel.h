//
//  Model.h
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DAFridge.h"
#import "DACounter.h"
#import "DAMenu.h"

@interface DAModel : DAObject {    
    DAFridge  *_fridge;
    DACounter *_counter;
    DAMenu *_menu;
    
}

@property (nonatomic, strong) DAFridge    *fridge;
@property (nonatomic, strong) DACounter   *counter;
@property (nonatomic, strong) DAMenu      *menu;

@end
