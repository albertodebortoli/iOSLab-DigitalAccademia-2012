//
//  DACounterViewController.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 12/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DACounterViewController.h"
#import "DAAppDelegate.h"
#import "NSObject+Model.h"

@implementation DACounterViewController

@synthesize balanceLabel = _balanceLabel;
@synthesize stepper = _stepper;
@synthesize model = _model;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (void)setBalance 
{
    self.balanceLabel.text = [NSString stringWithFormat:@"%.2f EURO", self.model.counter.balance];
    self.stepper.value = self.model.counter.balance;
}

- (void)notificationReceived:(NSNotification*)note
{
    [self setBalance];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.    
    
    self.model = [self sharedModel];
    [self setBalance];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationReceived:) name:@"balance" object:nil];
    
    // ricordarsi di deregistrarsi dalla notifica!
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.balanceLabel = nil;
    self.stepper = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"balance" object:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)stepperValueChanged:(id)sender
{
    self.model.counter.balance = self.stepper.value;
    [self setBalance];
}

- (IBAction)thrashButtonTapped:(id)sender
{
    self.stepper.value = 0.0;
    [self stepperValueChanged:sender];
    
}


@end
