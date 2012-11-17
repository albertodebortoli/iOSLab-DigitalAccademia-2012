//
//  DANumberViewController.m
//  iOS-Debugging
//
//  Created by Alberto De Bortoli on 7/17/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "DANumberDetailViewController.h"
#import "DAMacros.h"

@implementation DANumberDetailViewController

@synthesize numberLabel;
@synthesize numberCharacterLabel;
@synthesize numberValue;
@synthesize numberCharacter;

- (id)initWithNumber:(NSNumber *)number character:(NSString *)character
{
    self = [super initWithNibName:@"DANumberDetailViewController" bundle:nil];
    if (self) {
        self.numberValue = number;
        self.numberCharacter = character;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.numberLabel.text = STRING([numberValue intValue]);
    self.numberCharacterLabel.text = self.numberCharacter;

    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    singleTapGestureRecognizer.numberOfTapsRequired = 1;
    singleTapGestureRecognizer.numberOfTouchesRequired = 1;
    [self.numberLabel addGestureRecognizer:singleTapGestureRecognizer];
    [singleTapGestureRecognizer release];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc
{
    // not necessary, [numberLabel release] does this for us
    //    for (UIGestureRecognizer *gr in numberLabel.gestureRecognizers) {
    //        [numberLabel removeGestureRecognizer:gr];
    //    }
        
    //    numberLabel.gestureRecognizers = nil;
    
    [numberLabel release];
    [numberCharacterLabel release];
    [numberValue release];
    [numberValueLabel release];
    [super dealloc];
}

@end
