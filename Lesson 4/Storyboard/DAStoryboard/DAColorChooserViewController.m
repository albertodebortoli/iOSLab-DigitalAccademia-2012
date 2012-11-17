//
//  DAColorChooserViewController.m
//  DAStoryboard
//
//  Created by Enrico Zeffiro on 24/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DAColorChooserViewController.h"

@implementation DAColorChooserViewController

- (IBAction)anyButtonTapped:(id)sender
{
    NSArray *segueIdentifiers = @[@"red", @"green", @"blu"];
    NSUInteger index = (arc4random() % [segueIdentifiers count]);
    NSString *segueIdentifier = segueIdentifiers[index];
    
    [self performSegueWithIdentifier:segueIdentifier sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *next = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"red"]) {
        next.view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1.0];
    }
    else if ([segue.identifier isEqualToString:@"green"]) {
        next.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1.0];
    }
    else if ([segue.identifier isEqualToString:@"blu"]) {
        next.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1.0];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
