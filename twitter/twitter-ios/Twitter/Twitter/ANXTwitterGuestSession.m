//
//  ANXTwitterGuestSession.m
//  Twitter
//
//  Created by Max Rozdobudko on 12/12/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXTwitterGuestSession.h"

@implementation ANXTwitterGuestSession

-(id) init: (TWTRGuestSession*) session
{
    self = [super init];
    
    self.originalSession = session;
    
    return self;
}

#pragma mark Properties

@synthesize originalSession;

#pragma mark Methods

-(FREObject) toFREObject
{
    FREResult result;
    
    FREObject session;
    result = FRENewObject((const uint8_t *) "com.github.airext.fabric.data.TwitterGuestSession", 0, NULL, &session, NULL);
    
    if (result != FRE_OK)
        return NULL;
    
    // accessToken
    
    FREObject accessToken = [ANXFabricConversionRoutines convertNSStringToFREObject: self.originalSession.accessToken];
    
    result = FRESetObjectProperty(session, (const uint8_t *) "accessToken", accessToken, NULL);
    
    if (result != FRE_OK)
        return NULL;
    
    // guestToken
    
    FREObject guestToken = [ANXFabricConversionRoutines convertNSStringToFREObject: self.originalSession.guestToken];
    
    result = FRESetObjectProperty(session, (const uint8_t *) "guestToken", guestToken, NULL);
    
    if (result != FRE_OK)
        return NULL;
    
    return session;
}

@end
