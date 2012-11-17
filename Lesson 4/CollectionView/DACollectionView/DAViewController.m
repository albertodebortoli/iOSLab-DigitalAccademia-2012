//
//  DAViewController.m
//  DACollectionView
//
//  Created by Alessandro Benvenuti on 14/11/12.
//  Copyright (c) 2012 Alessandro Benvenuti. All rights reserved.
//

#import "DAViewController.h"
#import "DASpringboardLayout.h"
#import "DACollectionViewCell.h"

@interface DAViewController ()
@property NSArray *pickerList;
@end

@implementation DAViewController

static NSString *identifier = @"cellIdentifier";

# pragma mark - CollectionViewControllerDelegate

# pragma mark - CollectionViewControllerDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.pickerList count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DACollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    CGRect pickerFrame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
    UILabel *label = [[UILabel alloc] initWithFrame:pickerFrame];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [self.pickerList objectAtIndex:indexPath.row];
    
    [cell addSubview:label];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *pickerType = [self.pickerList objectAtIndex:indexPath.row];
    if ([pickerType isEqualToString:@""]) {
        return;
    }
    [self performSegueWithIdentifier:@"toModal" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toModal"]) {
        UIViewController *detailController = segue.destinationViewController;
        NSIndexPath *selectedItem = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        NSString *pickerType = [self.pickerList objectAtIndex:selectedItem.row];
        UIView *picker = nil;
        
        if (pickerType == @"Date Picker") {
            picker = [[UIDatePicker alloc] init];
            picker.center = detailController.view.center;
        }
        
        if (pickerType == @"Stepper") {
            picker = [[UIStepper alloc] init];
            picker.center = detailController.view.center;
        }
        
        if (pickerType == @"Page Control") {
            picker = [[UIPageControl alloc] init];
            ((UIPageControl *)picker).numberOfPages = 5;
            ((UIPageControl *)picker).pageIndicatorTintColor = [UIColor grayColor];
            ((UIPageControl *)picker).currentPageIndicatorTintColor = [UIColor redColor];
            picker.center = detailController.view.center;
        }
        
        [detailController.view addSubview:picker];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[DACollectionViewCell class] forCellWithReuseIdentifier:identifier];
    self.pickerList = @[@"Date Picker", @"", @"Stepper", @"", @"Page Control", @""];
}

@end
