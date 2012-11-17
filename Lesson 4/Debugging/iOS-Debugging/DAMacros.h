//
//  DAMacros.h
//  iOS-Debugging
//
//  Created by Alberto De Bortoli on 7/17/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#ifndef iOS_Debugging_DAMacros_h
#define iOS_Debugging_DAMacros_h

#define GET_APP_DELEGATE()\
    ((DAAppDelegate *)[UIApplication sharedApplication].delegate)

#define STRING(integer)\
    [NSString stringWithFormat:@"%i", integer]

#endif
