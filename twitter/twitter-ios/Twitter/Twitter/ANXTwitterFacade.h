//
//  Twitter.h
//  Twitter
//
//  Created by Max Rozdobudko on 11/10/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <TwitterKit/TwitterKit.h>

#import "FlashRuntimeExtensions.h"

#import "ANXBridgeCall.h"

#import "ANXTwitterSession.h"
#import "ANXTwitterGuestSession.h"
#import "ANXDigitsSession.h"

#import "ANXFabricConversionRoutines.h"

@interface ANXTwitterFacade : NSObject

@end

#pragma mark API

FREObject ANXTwitterIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

#pragma mark Twitter

FREObject ANXTwitterLogin(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXTwitterLogout(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);


FREObject ANXTwitterLoginGuest(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXTwitterLogoutGuest(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

#pragma mark Digits

FREObject ANXDigitsAuthenticate(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXDigitsLogout(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

#pragma mark ContextInitialize/ContextFinalizer

void ANXTwitterContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);

void ANXTwitterContextFinalizer(FREContext ctx);

#pragma mark Initializer/Finalizer

void ANXTwitterInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);

void ANXTwitterFinalizer(void* extData);
