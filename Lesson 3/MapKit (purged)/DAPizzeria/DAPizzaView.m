//
//  DAPizzaView.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DAPizzaView.h"

@implementation DAPizzaView

@synthesize pizza = _pizza;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame andPizza:(DAPizza*)pizza
{
    self = [super initWithFrame:frame];
    if (self) {
        _pizza = pizza;
        self.clipsToBounds = YES;
        
        
        // ImageView
        UIImage *pizzaImage = [UIImage imageWithContentsOfFile:pizza.imgPath];
        UIImageView *pizzaImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kPizzaViewWidth, kPizzaViewHeight)];

        pizzaImageView.contentMode = UIViewContentModeScaleAspectFill;
        pizzaImageView.image = pizzaImage;
        
        // Labels countainers
        UIView *labelsView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kPizzaViewWidth, 100)];
        labelsView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        
        // Labels
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 20.0, kPizzaViewWidth - 40, 28)];
        nameLabel.font = [UIFont boldSystemFontOfSize:24.0];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.shadowColor = [UIColor blackColor];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.text = self.pizza.name;
        
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 45, kPizzaViewWidth - 20, 20)];
        descriptionLabel.font = [UIFont systemFontOfSize:14.0];
        descriptionLabel.textColor = [UIColor whiteColor];
        descriptionLabel.shadowColor = [UIColor blackColor];
        descriptionLabel.backgroundColor = [UIColor clearColor];
        descriptionLabel.text = self.pizza.desc;


        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 62, kPizzaViewWidth - 20, 20)];
        priceLabel.font = [UIFont systemFontOfSize:14.0];
        priceLabel.textColor = [UIColor whiteColor];
        priceLabel.shadowColor = [UIColor blackColor];
        priceLabel.backgroundColor = [UIColor clearColor];
        priceLabel.text = [NSString stringWithFormat:@"%.0f EURO", self.pizza.price];  
        
        
        UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        buyButton.frame = CGRectMake(240, 30, 60, 40);
        [buyButton setTitle:@"buy" forState:UIControlStateNormal];
        
        
        [labelsView addSubview:nameLabel];
        [labelsView addSubview:descriptionLabel];
        [labelsView addSubview:priceLabel];
        
        if (self.pizza.canBeOrdered) {
            [labelsView addSubview:buyButton];
        }
        
        [self addSubview:pizzaImageView];
        [self addSubview:labelsView];
        
        [self addSubview:nameLabel];
    }
    return self;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/



@end
