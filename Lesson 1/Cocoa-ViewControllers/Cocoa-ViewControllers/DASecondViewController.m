//
//  DASecondViewController.m
//  Cocoa-ViewControllers
//
//  Created by iOSLab on 7/10/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "DASecondViewController.h"

@implementation DASecondViewController

- (IBAction)presentButtonPressed:(id)sender
{
    DAPresentedViewController *presentViewController = [[DAPresentedViewController alloc] initWithNibName:@"DAPresentedViewController" bundle:nil];
    [self presentModalViewController:presentViewController animated:YES];
    [presentViewController release];
}

@end
