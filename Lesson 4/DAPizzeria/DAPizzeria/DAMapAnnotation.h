//
//  DAMapAnnotation.h
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DAMapAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D _coordinate;
    NSString *_title;
    NSString *_subtitle;
    NSString *_longDescription;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;
@property (nonatomic, readonly, copy) NSString *longDescription;

- (DAMapAnnotation*) initWithLocationCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle;

- (DAMapAnnotation*) initWithLatitude:(CGFloat)latitude longitude:(CGFloat)longitude title:(NSString*)title subtitle:(NSString*)subtitle longDescription:(NSString*)longDescription;


@end
