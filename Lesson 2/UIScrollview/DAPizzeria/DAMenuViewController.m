//
//  DAMenuViewController.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 Enrico Zeffiro. All rights reserved.
//

#import "DAMenuViewController.h"
#import "NSObject+Model.h"
#import "DAPizzaView.h"

@implementation DAMenuViewController

@synthesize scrollView = _scrollView;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //NSLog(@"Hi, I'm the menu and my pizza are: %@", [self sharedModel].menu.pizzas);
    
    NSInteger numberOfPizzas = [[self sharedModel].menu.pizzas count];
    self.scrollView.contentSize = CGSizeMake(kPizzaViewWidth * numberOfPizzas, self.scrollView.bounds.size.height);
    self.scrollView.pagingEnabled = YES;

    
    for (NSInteger i = 0; i < [[self sharedModel].menu.pizzas count]; i++) {
        DAPizza *pizza = [[self sharedModel].menu.pizzas objectAtIndex:i];
        CGRect pizzaRect = CGRectMake(i * kPizzaViewWidth, 0, kPizzaViewWidth, kPizzaViewHeight);
        DAPizzaView *pizzaView = [[DAPizzaView alloc] initWithFrame:pizzaRect andPizza:pizza];
        [self.scrollView addSubview:pizzaView];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.scrollView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
