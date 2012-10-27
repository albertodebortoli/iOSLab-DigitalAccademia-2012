//
//  DAViewController.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 05/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAFridgeViewController.h"
#import "DAAppDelegate.h"
#import "DAIngredient.h"
#import "DAIngredientViewcontroller.h"

@implementation DAFridgeViewController

@synthesize model = _model;
@synthesize tableView = _tableView;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.title = @"Fridge";

    self.model = ((DAAppDelegate*)([UIApplication sharedApplication].delegate)).model;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.tableView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model.fridge countOfIngredients];
}

#pragma mark UITableViewDataDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    DAIngredient *ingredient = [self.model.fridge ingredientAtIndexPath:indexPath];
    
    cell.textLabel.text = ingredient.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", ingredient.quantity];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    DAIngredientViewcontroller *ivc = [[DAIngredientViewcontroller alloc] initWithNibName:@"DAIngredientViewcontroller" bundle:nil ingredient:[self.model.fridge ingredientAtIndexPath:indexPath]];
    [self.navigationController pushViewController:ivc animated:YES];
}

@end
