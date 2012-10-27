//
//  DAPizzaView.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 Enrico Zeffiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAPizza.h"


#define kPizzaViewWidth 320.0
#define kPizzaViewHeight 411.0

@interface DAPizzaView : UIView {
    
    DAPizza *_pizza;
}

@property (nonatomic, strong) DAPizza *pizza;

- (id)initWithFrame:(CGRect)frame andPizza:(DAPizza*)pizza;

@end
