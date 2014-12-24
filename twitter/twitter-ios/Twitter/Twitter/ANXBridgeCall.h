//
//  ANXBridgeCall.h
//  Twitter
//
//  Created by Max Rozdobudko on 12/11/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FlashRuntimeExtensions.h"

@interface ANXBridgeCall : NSObject

+(ANXBridgeCall*) create: (FREContext) context;

@property FREContext context;

@property NSUInteger callId;

@property id completionValue;

@property NSError* failureReason;

-(void) result: (id) value;

-(void) reject: (NSError*) error;

-(FREObject) toFREObject;

@end

#pragma mark C API

void ANXBridgeInitializer(uint32_t* numFunctionsToTest, FRENamedFunction** functionsToSet);

FREObject ANXBridgeCallGetValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);
FREObject ANXBridgeCallGetError(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);