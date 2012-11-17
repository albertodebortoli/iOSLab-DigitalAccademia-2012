//
//  DAViewController.m
//  iOS-Debugging
//
//  Created by Alberto De Bortoli on 7/17/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "DANumberListViewController.h"
#import "DANumberDetailViewController.h"
#import "DAData.h"
#import "DAMacros.h"

#define kDALostNumbersMultiplier 10

@implementation DANumberListViewController

@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[DAData sharedInstance] numbers] count] * kDALostNumbersMultiplier;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reusableIdentifier = @"tableViewCell";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:reusableIdentifier];
    if (!tableViewCell) {
        tableViewCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:reusableIdentifier] autorelease];
        
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellPressed:)];
        singleTapGestureRecognizer.numberOfTapsRequired = 1;
        singleTapGestureRecognizer.numberOfTouchesRequired = 1;
        [tableViewCell addGestureRecognizer:singleTapGestureRecognizer];
        [singleTapGestureRecognizer release];
    }
    
    NSUInteger cellIndex = (indexPath.row) % [[[DAData sharedInstance] numbers] count];
    NSDictionary *numberDict = [[[DAData sharedInstance] numbers] objectAtIndex:cellIndex];
    NSNumber *number = [numberDict objectForKey:@"number"];
    NSString *character = [numberDict objectForKey:@"character"];
    
    tableViewCell.textLabel.text = STRING([number intValue]);
    tableViewCell.detailTextLabel.text = [character capitalizedString];
    tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    tableViewCell.tag = indexPath.row;

    return tableViewCell;
}

- (void)cellPressed:(UITapGestureRecognizer *)gestureRecognizer
{
    UITableViewCell *cell = (UITableViewCell *)[gestureRecognizer view];
    
    NSDictionary *numberDict = [[[DAData sharedInstance] numbers] objectAtIndex:(cell.tag) % [[[DAData sharedInstance] numbers] count]];
    NSNumber *number = [numberDict objectForKey:@"number"];
    NSString *character = [numberDict objectForKey:@"character"];
    DANumberDetailViewController *detailController = [[DANumberDetailViewController alloc] initWithNumber:number character:character];
    [self presentModalViewController:detailController animated:YES];
    [detailController release];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *numberDict = [[[DAData sharedInstance] numbers] objectAtIndex:(indexPath.row) % [[[DAData sharedInstance] numbers] count]];
    NSNumber *number = [numberDict objectForKey:@"number"];
    NSString *character = [numberDict objectForKey:@"character"];
    DANumberDetailViewController *detailController = [[DANumberDetailViewController alloc] initWithNumber:number character:character];
    [self presentModalViewController:detailController animated:YES];
    [detailController release];
}

@end
