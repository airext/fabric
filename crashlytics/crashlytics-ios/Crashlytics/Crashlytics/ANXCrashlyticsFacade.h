//
//  Crashlytics.h
//  Crashlytics
//
//  Created by Max Rozdobudko on 11/5/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FlashRuntimeExtensions.h"

#import "ANXCrashlyticsConversionRoutines.h"

@interface ANXCrashlyticsFacade : NSObject

@end

#pragma mark API

FREObject ANXCrashlyticsIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXCrashlyticsAPIKey(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXCrashlyticsVersion(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXCrashlyticsGetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);
FREObject ANXCrashlyticsSetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXCrashlyticsCrash(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

// Logging

FREObject ANXCrashlyticsLog(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

// Identifying

FREObject ANXCrashlyticsSetUserIdentifier(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);
FREObject ANXCrashlyticsSetUserName(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);
FREObject ANXCrashlyticsSetUserEmail(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

// Enhancing

FREObject ANXCrashlyticsSetObjectValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);
FREObject ANXCrashlyticsSetIntValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);
FREObject ANXCrashlyticsSetBoolValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);
FREObject ANXCrashlyticsSetFloatValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

// Callbacks

FREObject ANXCrashlyticsPickCrashReport(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);
FREObject ANXCrashlyticsInstallCallbacks(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);
FREObject ANXCrashlyticsUninstallCallbacks(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

#pragma mark ContextInitialize/ContextFinalizer

void ANXCrashlyticsContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);

void ANXCrashlyticsContextFinalizer(FREContext ctx);

#pragma mark Initializer/Finalizer

void ANXCrashlyticsInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);

void ANXCrashlyticsFinalizer(void* extData);
