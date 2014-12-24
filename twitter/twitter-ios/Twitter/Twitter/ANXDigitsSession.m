//
//  ANXDigitsSession.m
//  Twitter
//
//  Created by Max Rozdobudko on 12/12/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXDigitsSession.h"

@implementation ANXDigitsSession

#pragma mark Constructor

-(id) init: (DGTSession*) session
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
    result = FRENewObject((const uint8_t *) "com.github.airext.fabric.data.DigitsSession", 0, NULL, &session, NULL);
    
    if (result != FRE_OK)
        return NULL;
    
    // authToken
    
    FREObject authToken = [ANXFabricConversionRoutines convertNSStringToFREObject: self.originalSession.authToken];
    
    result = FRESetObjectProperty(session, (const uint8_t *) "authToken", authToken, NULL);
    
    if (result != FRE_OK)
        return NULL;
    
    // authTokenSecret
    
    FREObject authTokenSecret = [ANXFabricConversionRoutines convertNSStringToFREObject: self.originalSession.authTokenSecret];
    
    result = FRESetObjectProperty(session, (const uint8_t *) "authTokenSecret", authTokenSecret, NULL);
    
    if (result != FRE_OK)
        return NULL;
    
    // userId
    
    FREObject userId = [ANXFabricConversionRoutines convertNSStringToFREObject: self.originalSession.userID];
    
    result = FRESetObjectProperty(session, (const uint8_t *) "userId", userId, NULL);
    
    if (result != FRE_OK)
        return NULL;
    
    // phoneNumber
    
    FREObject phoneNumber = [ANXFabricConversionRoutines convertNSStringToFREObject: self.originalSession.phoneNumber];
    
    result = FRESetObjectProperty(session, (const uint8_t *) "phoneNumber", phoneNumber, NULL);
    
    if (result != FRE_OK)
        return NULL;
    
    return session;
}

@end
