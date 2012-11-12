//
//  ViewController.m
//

#import "ViewController.h"

@implementation ViewController

@synthesize imageView;
@synthesize openGallery;
@synthesize takePhoto;
@synthesize picker;
@synthesize popover;

- (IBAction)openGallery:(id)sender
{
	self.picker = [[UIImagePickerController alloc] init];
	self.picker.delegate = self;
	self.picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) 
    {
        self.popover = [[UIPopoverController alloc] initWithContentViewController:self.picker];
        [self.popover presentPopoverFromRect:CGRectMake(openGallery.frame.origin.x + (openGallery.frame.size.width / 2), openGallery.frame.origin.y - 10, 0.0, 0.0) 
                                 inView:self.view
               permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self presentModalViewController:picker animated:YES];
    }
}

- (IBAction)takePhoto:(id)sender
{
	self.picker = [[UIImagePickerController alloc] init];
	self.picker.delegate = self;
    self.picker.allowsEditing = YES;
	self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) 
    {
        self.popover = [[UIPopoverController alloc] initWithContentViewController:picker];
        [self.popover presentPopoverFromRect:CGRectMake(takePhoto.frame.origin.x + (takePhoto.frame.size.width / 2), takePhoto.frame.origin.y - 10, 0.0, 0.0) 
                                 inView:self.view 
               permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self presentModalViewController:picker animated:YES];
    }	
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
    NSLog(@"%@", info[UIImagePickerControllerMediaMetadata]);
    if (self.picker.sourceType != UIImagePickerControllerSourceTypeCamera) {
        imageView.image = info[@"UIImagePickerControllerOriginalImage"];
    }
    else {
        imageView.image = info[@"UIImagePickerControllerEditedImage"];
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.popover dismissPopoverAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
