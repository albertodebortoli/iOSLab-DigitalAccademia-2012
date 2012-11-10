//
//  DAIngredientViewcontroller.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 12/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAIngredientViewcontroller.h"

@implementation DAIngredientViewcontroller

@synthesize currentIngredient = _ingredient;
@synthesize nameLabel = _nameLabel;
@synthesize quantityLabel = _quantityLabel;
@synthesize priceLabel = _priceLabel;
@synthesize stepper = _stepper;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil ingredient:(DAIngredient*)ingredient 
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _ingredient = ingredient;
    }
    return self;
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = self.currentIngredient.name;
    self.nameLabel.text = self.currentIngredient.name;
    self.quantityLabel.text = [NSString stringWithFormat:@"%d", self.currentIngredient.quantity];
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f EUR", self.currentIngredient.price];
    self.stepper.value = self.currentIngredient.quantity;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.nameLabel = nil;
    self.quantityLabel = nil;
    self.priceLabel = nil;
    self.stepper = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)stepperValueChanged:(id)sender 
{
    NSLog(@"%@", sender);
    
    self.currentIngredient.quantity = self.stepper.value;
    self.quantityLabel.text = [NSString stringWithFormat:@"%d", self.currentIngredient.quantity];
}


@end
