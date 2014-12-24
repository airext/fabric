//
//  ANXBridgeCall.h
//  Bridge
//
//  Created by Max Rozdobudko on 12/22/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "FlashRuntimeExtensions.h"

@interface ANXBridgeCall : NSObject

#pragma mark Constructor

-(id) init: (FREContext) aContext callId: (NSUInteger) aCallId;

# pragma mark Getters

-(id) getResultValue;

-(NSError*) getRejectReason;

# pragma mark Methods

-(void) result: (id) value;

-(void) reject: (NSError*) error; 

-(FREObject) toFREObject;

@end
