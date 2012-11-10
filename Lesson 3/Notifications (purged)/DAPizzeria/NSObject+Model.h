//
//  NSObject+Model.h
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAModel.h"

@interface NSObject (DAModel)

- (DAModel*)sharedModel;

@end
