//
//  DAViewController.m
//  ObjC-Delegation
//
//  Created by Alberto De Bortoli on 7/4/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAViewController.h"
#import "DAModel.h"


@interface DAViewController ()

@end

@implementation DAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        persons = [DAModel getPersons];
    }
    return self;
}

#pragma mark - UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [persons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        NSLog(@"This cell has been brand new allocated, can't reuse a previous one.");
    } else {
        NSLog(@"This cell has been reused, not brand new allocated.");
    }
    
    tableViewCell.textLabel.text = [((DAPerson *)[persons objectAtIndex:indexPath.row]) name];
    tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return tableViewCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = [((DAPerson *)[persons objectAtIndex:indexPath.row]) name];
    NSString *subtitle = [((DAPerson *)[persons objectAtIndex:indexPath.row]) cardInfo];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:subtitle
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Alert view is about to be dismissed");    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Alert view has been dismissed");
}

@end
