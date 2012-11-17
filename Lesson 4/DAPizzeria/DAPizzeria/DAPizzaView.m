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
@synthesize buyButton = _buyButton;


- (void)buyButtonTapped
{
    [self.pizza buy];
}

- (void)setButButtonVisibility
{
    // Animation with block
    [UIView animateWithDuration:2.0 
                     animations:^{
                         if ([self.pizza canBeOrdered]) {
                             self.buyButton.alpha = 1.0;
                             self.buyButton.frame = CGRectMake(240, 30, 60, 40);
                         }
                         else {
                             self.buyButton.alpha = 0.0;
                             self.buyButton.frame = CGRectMake(340, 30, 60, 40);
                         }    
                     }];
    
    // Animation the old way
    /*
    [UIView beginAnimations:@"hideButton" context:nil];
    if ([self.pizza canBeOrdered]) {
        self.buyButton.alpha = 1.0;
        self.buyButton.frame = CGRectMake(240, 30, 60, 40);
    }
    else {
        self.buyButton.alpha = 0.0;
        self.buyButton.frame = CGRectMake(340, 30, 60, 40);
    }    
    [UIView commitAnimations];
     */
}

- (void)notificationReceived:(NSNotification*)note 
{
    [self setButButtonVisibility];    
}

- (id)initWithFrame:(CGRect)frame andPizza:(DAPizza*)pizza
{
    self = [super initWithFrame:frame];
    if (self) {
        _pizza = pizza;
        self.clipsToBounds = YES;
        
        
        // ImageView
        UIImage *pizzaImage = [pizza image];
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
        [buyButton addTarget:self action:@selector(buyButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        self.buyButton = buyButton;
        
        
        [labelsView addSubview:nameLabel];
        [labelsView addSubview:descriptionLabel];
        [labelsView addSubview:priceLabel];
        [labelsView addSubview:buyButton];

        
        
        [self setButButtonVisibility];
        
        [self addSubview:pizzaImageView];
        [self addSubview:labelsView];
        
        [self addSubview:nameLabel];
        
        for (DAIngredient *ingredient in self.pizza.ingredients) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationReceived:) name:@"ingredientQuantity" object:ingredient];
        }
    }
    return self;
    
}




- (void)dealloc 
{
    for (DAIngredient *ingredient in self.pizza.ingredients) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ingredientQuantity" object:ingredient];
    }
}
@end
