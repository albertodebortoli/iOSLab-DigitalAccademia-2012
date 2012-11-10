//
//  DAMapViewController.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 15/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DAMapViewController : UIViewController <MKMapViewDelegate> {
    MKMapView *_mapView;
}

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

- (IBAction)mapStyleSegmentedTapped:(id)sender;

@end
