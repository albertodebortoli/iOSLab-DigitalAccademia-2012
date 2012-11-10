//
//  DAMapViewController.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DAMapViewController.h"
#import "DAMapAnnotation.h"
#import "AFNetworking.h"

#define kDALatitude 45.563615
#define kDALongitude 12.422666

#define kHumusLatitude 45.564216
#define kHumusLongitude 12.427419

#define kHFARMLatitude 45.56405
#define kHFARMLongitude 12.428578

@implementation DAMapViewController

@synthesize mapView = _mapView;


#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(kDALatitude, kDALongitude), MKCoordinateSpanMake(0.01, 0.01));
    
    [self showStaticAnnotationsForLocation:CLLocationCoordinate2DMake(kDALatitude, kDALongitude)];
    [self showDynamicAnnotationsForLocation:CLLocationCoordinate2DMake(kDALatitude, kDALongitude)];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.mapView = nil;
}

- (IBAction)mapStyleSegmentedTapped:(id)sender
{
    UISegmentedControl *segmented = (UISegmentedControl *)sender;
    self.mapView.mapType = segmented.selectedSegmentIndex;
}

#pragma mark Static Annotations

- (void)showStaticAnnotationsForLocation:(CLLocationCoordinate2D)coordinate
{
    // ignoro il parametro
    CLLocationCoordinate2D coordinate1 = CLLocationCoordinate2DMake(kDALatitude, kDALongitude);
    DAMapAnnotation *annotation1 = [[DAMapAnnotation alloc] initWithLocationCoordinate:coordinate1 title:@"Valentina Paruzzi" subtitle:@"Digital Accademia"];
    
    CLLocationCoordinate2D coordinate2 = CLLocationCoordinate2DMake(kHumusLatitude, kHumusLongitude);
    DAMapAnnotation *annotation2 = [[DAMapAnnotation alloc] initWithLocationCoordinate:coordinate2 title:@"Debo Wolf Zeff" subtitle:@"H-umus - Space as a media"];
    
    CLLocationCoordinate2D coordinate3 = CLLocationCoordinate2DMake(kHFARMLatitude, kHFARMLongitude);
    DAMapAnnotation *annotation3 = [[DAMapAnnotation alloc] initWithLocationCoordinate:coordinate3 title:@"Riccardo Donadon" subtitle:@"H-FARM Ventures"];
    
    [self.mapView addAnnotation:annotation1];
    [self.mapView addAnnotation:annotation2];
    [self.mapView addAnnotation:annotation3];    
}

#pragma mark Dynamic Annotations

- (void)showDynamicAnnotationsForLocation:(CLLocationCoordinate2D)coordinate
{
    NSURL *url = [NSURL URLWithString:@"http://www.h-umus.it/prevben/annotations.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation =
        [AFJSONRequestOperation JSONRequestOperationWithRequest:request
            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
            {
                [self manageAnnotationsJSON:JSON];
            }
            failure:^(NSURLRequest *request , NSHTTPURLResponse *response , NSError *error , id JSON)
            {
                NSLog(@"Error: %@", error);
            }
        ];
    [operation start];
    
}


- (void)manageAnnotationsJSON:(id)JSON
{
    NSLog(@"Response: %@", JSON);
    NSArray *annotationsArray = (NSArray*)JSON;
    for (NSDictionary *annotationDictionary in annotationsArray) {
        CGFloat latitude = [((NSString*)[annotationDictionary objectForKey:@"latitude"]) floatValue];
        CGFloat longitude = [((NSString*)[annotationDictionary objectForKey:@"longitude"]) floatValue];
        NSString *title = [annotationDictionary objectForKey:@"title"];
        NSString *subtitle = [annotationDictionary objectForKey:@"subtitle"];
        NSString *longDescription = [annotationDictionary objectForKey:@"longDescription"];
        DAMapAnnotation *annotation = [[DAMapAnnotation alloc] initWithLatitude:latitude longitude:longitude title:title subtitle:subtitle longDescription:longDescription];
        // aggiungo le annotation alla mappa
        [self.mapView addAnnotation:annotation];
    }
}

#pragma mark Annotation view

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation
{
    MKPinAnnotationView *pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Pin"];
    pinView.pinColor = MKPinAnnotationColorPurple;
    pinView.canShowCallout = YES;
    pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    pinView.animatesDrop = YES;
    return pinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:view.annotation.title 
                                                    message:((DAMapAnnotation*)view.annotation).longDescription
                                                   delegate:self 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
}





@end
