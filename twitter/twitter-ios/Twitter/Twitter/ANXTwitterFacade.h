//
//  Twitter.h
//  Twitter
//
//  Created by Max Rozdobudko on 11/10/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Twitter/Twitter.h>

#import "FlashRuntimeExtensions.h"

#import "ANXFabricConversionRoutines.h"

@interface ANXTwitterFacade : NSObject

@end

#pragma mark API

FREObject ANXTwitterIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);


FREObject ANXTwitterLogin(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXTwitterLogout(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);


FREObject ANXTwitterLoginGuest(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXTwitterLogoutGuest(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

#pragma mark ContextInitialize/ContextFinalizer

void ANXTwitterContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);

void ANXTwitterContextFinalizer(FREContext ctx);

#pragma mark Initializer/Finalizer

void ANXTwitterInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);

void ANTwitterinalizer(void* extData);
