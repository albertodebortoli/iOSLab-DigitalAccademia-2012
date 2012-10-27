//
//  DAModel.m
//  ObjC-Delegation
//
//  Created by Enrico Zeffiro on 05/07/12.
//  Copyright (c) 2012 H-umus. All rights reserved.
//

#import "DAModel.h"

@implementation DAModel

+ (NSArray *)getPersons
{
    DAPerson *person1 = [[DAPerson alloc] initWithName:@"Zeff" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person2 = [[DAPerson alloc] initWithName:@"Debo" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person3 = [[DAPerson alloc] initWithName:@"Wolf" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person4 = [[DAPerson alloc] initWithName:@"Giorgia" birthDate:[NSDate date] sex:kDASexFemale];
    DAPerson *person5 = [[DAPerson alloc] initWithName:@"Alice" birthDate:[NSDate date] sex:kDASexFemale];
    DAPerson *person6 = [[DAPerson alloc] initWithName:@"Monica" birthDate:[NSDate date] sex:kDASexFemale];
    DAPerson *person7 = [[DAPerson alloc] initWithName:@"Bobo" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person8 = [[DAPerson alloc] initWithName:@"Paolo" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person9 = [[DAPerson alloc] initWithName:@"Fabio" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person10 = [[DAPerson alloc] initWithName:@"Riccardo" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person11 = [[DAPerson alloc] initWithName:@"Mauro" birthDate:[NSDate date] sex:kDASexMale];
    DAPerson *person12 = [[DAPerson alloc] initWithName:@"Alessandro" birthDate:[NSDate date] sex:kDASexMale];
    
    NSArray *persons = [[NSArray alloc] initWithObjects:person1, person2, person3, person4, person5, person6, person7, person8, person9, person10, person11, person12, nil];

    return persons;
}

@end
