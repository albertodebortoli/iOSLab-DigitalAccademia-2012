//
//  DAMapAnnotation.m
//  DAPizzeria
//
//  Created by Enrico Zeffiro on 16/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DAMapAnnotation.h"

@implementation DAMapAnnotation 

@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize longDescription = _longDescription;

- (DAMapAnnotation*) initWithLocationCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title subtitle:(NSString*)subtitle
{
    self = [super init];
    if (self) {
        _coordinate = coordinate;
        _title = title;
        _subtitle = subtitle;
    }
    return self;
}

- (DAMapAnnotation*) initWithLatitude:(CGFloat)latitude longitude:(CGFloat)longitude title:(NSString*)title subtitle:(NSString*)subtitle longDescription:(NSString*)longDescription;
{
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(latitude, longitude);
    self = [self initWithLocationCoordinate:location title:title subtitle:subtitle];
    if (self) {
        _longDescription = longDescription;
    }       
    return self;
}

    

@end
