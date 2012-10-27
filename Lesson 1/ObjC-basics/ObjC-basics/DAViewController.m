//
//  DAViewController.m
//  ObjC-basics
//
//  Created by Alberto De Bortoli on 30/06/12.
//  Copyright (c) 2012 iOSLab. All rights reserved.
//

#import "DAViewController.h"
#import "DAPerson.h"

@implementation DAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        maleNames = [[NSArray alloc] initWithObjects:@"Alberto", @"Alessandro", @"Enrico", nil];
        femaleNames = [[NSArray alloc] initWithObjects:@"Valentina", @"Francesca", @"Laura", nil];
    }

    return self;
}

- (IBAction)createAPersonAndLogit:(id)sender
{
    DASex sex = 0;
    NSArray *names = nil;
    
    if (sender == createMaleButton) {
        sex = kDASexMale;
        names = maleNames;
    } else if (sender == createFemaleButton) {
        sex = kDASexFemale;
        names = femaleNames;
    }
    
    NSString *chosenName = [names objectAtIndex:arc4random() % [names count]];
    DAPerson *person = [[DAPerson alloc] initWithName:chosenName birthDate:[NSDate date] sex:sex];
    logLabel.text = [person cardInfo];
}

@end
