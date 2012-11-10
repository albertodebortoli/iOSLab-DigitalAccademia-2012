//
//  Counter.h
//  DA-Pizza
//
//  Created by Enrico Zeffiro on 13/05/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DACounter : NSObject {
    CGFloat _balance;
}

@property (nonatomic, assign) CGFloat balance;

- (void)deposit:(CGFloat)amount;
- (CGFloat)withdraw:(CGFloat)amount;

@end
