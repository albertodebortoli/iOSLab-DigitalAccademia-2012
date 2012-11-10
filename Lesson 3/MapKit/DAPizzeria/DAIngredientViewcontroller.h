//
//  DAIngredientViewcontroller.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 12/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAIngredient.h"

@interface DAIngredientViewcontroller : UIViewController {
    DAIngredient *_ingredient;
    UILabel *_nameLabel;
    UILabel *_quantityLabel;
    UILabel *_priceLabel;
    UIStepper *_stepper;
}

@property (nonatomic, strong) DAIngredient *currentIngredient;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *quantityLabel;
@property (nonatomic, strong) IBOutlet UILabel *priceLabel;
@property (nonatomic, strong) IBOutlet UIStepper *stepper;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil ingredient:(DAIngredient*)ingredient;
- (IBAction)stepperValueChanged:(id)sender;

@end
