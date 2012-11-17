//
//  DAPizzaView.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAPizza.h"

#define kPizzaViewWidth 320.0
#define kPizzaViewHeight 411.0

@interface DAPizzaView : UIView {
    DAPizza *_pizza;
    UIButton *_buyButton;
}

@property (nonatomic, strong) DAPizza *pizza;
@property (nonatomic, strong) UIButton *buyButton;

- (id)initWithFrame:(CGRect)frame andPizza:(DAPizza*)pizza;


@end
