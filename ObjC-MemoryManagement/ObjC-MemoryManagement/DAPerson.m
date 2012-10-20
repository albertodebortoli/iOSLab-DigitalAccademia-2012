//
//  DAPerson.m
//  ObjC-basics
//
//  Created by Alberto De Bortoli on 30/06/12.
//  Copyright (c) 2012 iOSLab. All rights reserved.
//

#import "DAPerson.h"

@implementation DAPerson

@synthesize name = _name;
@synthesize birthDate = _birthDate;
@synthesize sex = _sex;

- (id)initWithName:(NSString *)aName birthDate:(NSDate *)aDate sex:(DASex)aSex
{
    self = [super init];
    
    if (self) {
        _name = [aName retain];
        _birthDate = [aDate retain];
        _sex = aSex;
    }
    
    return self;
}

- (NSString *)cardInfo
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/YYYY HH:mm:ss"];
    NSString *formattedDate = [formatter stringFromDate:self.birthDate];
    [formatter release];
    
    NSString *convertedSex = nil;
    
    switch (self.sex) {
        case kDASexMale:
            convertedSex = @"male";
            break;
        case kDASexFemale:
            convertedSex = @"female";
            break;
        default:
            convertedSex = @"unknown";
            break;
    }
    
    return [NSString stringWithFormat:@"My name is %@, I'm born on %@, I'm a %@ and my RAM memory address is %p", self.name, formattedDate, convertedSex, self];
}

+ (DAPerson *)createAPerson
{
    DAPerson *retVal = [[DAPerson alloc] initWithName:@"John Doe" birthDate:[NSDate date] sex:kDASexMale];
    [retVal autorelease];
    return retVal;
}

- (id)copyWithZone:(NSZone *)zone
{
    DAPerson *copy = [[[super class] allocWithZone:zone] init];
    copy.name = _name;
    copy.birthDate = _birthDate;
    copy.sex = _sex;
    return copy;
}

@end
