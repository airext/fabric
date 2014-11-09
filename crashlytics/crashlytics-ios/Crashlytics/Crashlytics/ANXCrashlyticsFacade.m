//
//  Crashlytics.m
//  Crashlytics
//
//  Created by Max Rozdobudko on 11/5/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXCrashlyticsFacade.h"

#import <Crashlytics/Crashlytics.h>

@implementation ANXCrashlyticsFacade

@end

#pragma mark API

// Info

FREObject ANXCrashlyticsIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXCrashlyticsIsSupported");
    
    return [ANXCrashlyticsConversionRoutines convertBoolToFREObject:YES];
}

FREObject ANXCrashlyticsAPIKey(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return [ANXCrashlyticsConversionRoutines convertNSStringToFREObject:[Crashlytics sharedInstance].apiKey];
}

FREObject ANXCrashlyticsVersion(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return [ANXCrashlyticsConversionRoutines convertNSStringToFREObject:[Crashlytics sharedInstance].version];
}

// Debugging

FREObject ANXCrashlyticsCrash(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXCrashlyticsCrash");
    
    [[Crashlytics sharedInstance] crash];
    
    return NULL;
}

FREObject ANXCrashlyticsLog(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXCrashlyticsLog");

    CLS_LOG(@"%@", [ANXCrashlyticsConversionRoutines convertFREObjectToNSString:argv[0]]);
    
    return NULL;
}

FREObject ANXCrashlyticsGetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return [ANXCrashlyticsConversionRoutines convertBoolToFREObject:[Crashlytics sharedInstance].debugMode];
}

FREObject ANXCrashlyticsSetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    [Crashlytics sharedInstance].debugMode = [ANXCrashlyticsConversionRoutines convertFREObjectToBool:argv[0]];
    
    return NULL;
}

// Identifying

FREObject ANXCrashlyticsSetUserIdentifier(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSString *value = [ANXCrashlyticsConversionRoutines convertFREObjectToNSString:argv[0]];
    
    [[Crashlytics sharedInstance] setUserIdentifier: value];
    
    return NULL;
}

FREObject ANXCrashlyticsSetUserName(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSString *value = [ANXCrashlyticsConversionRoutines convertFREObjectToNSString:argv[0]];
    
    [[Crashlytics sharedInstance] setUserName:value];
    
    return NULL;
}

FREObject ANXCrashlyticsSetUserEmail(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSString *value = [ANXCrashlyticsConversionRoutines convertFREObjectToNSString:argv[0]];
    
    [[Crashlytics sharedInstance] setUserEmail:value];
    
    return NULL;
}

// Enhancing

FREObject ANXCrashlyticsSetObjectValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSString *key = [ANXCrashlyticsConversionRoutines convertFREObjectToNSString:argv[0]];
    NSString *value = [ANXCrashlyticsConversionRoutines convertFREObjectToNSString:argv[1]];
    
    [[Crashlytics sharedInstance] setObjectValue:value forKey:key];
    
    return NULL;
}

FREObject ANXCrashlyticsSetIntValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSString *key = [ANXCrashlyticsConversionRoutines convertFREObjectToNSString:argv[0]];
    int value = [ANXCrashlyticsConversionRoutines convertFREObjectToInt:argv[1] withDefault:0];
    
    [[Crashlytics sharedInstance] setIntValue:value forKey:key];
    
    return NULL;
}

FREObject ANXCrashlyticsSetBoolValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSString *key = [ANXCrashlyticsConversionRoutines convertFREObjectToNSString:argv[0]];
    BOOL value = [ANXCrashlyticsConversionRoutines convertFREObjectToBool:argv[1]];
    
    [[Crashlytics sharedInstance] setBoolValue:value forKey:key];
    
    return NULL;
}

FREObject ANXCrashlyticsSetFloatValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSString *key = [ANXCrashlyticsConversionRoutines convertFREObjectToNSString:argv[0]];
    float value = [ANXCrashlyticsConversionRoutines convertFREObjectToFloat:argv[1] withDefault:0];
    
    [[Crashlytics sharedInstance] setFloatValue:value forKey:key];
    
    return NULL;
}

// Callbacks

FREObject ANXCrashlyticsPickCrashReport(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return NULL;
}

FREObject ANXCrashlyticsInstallCallbacks(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return NULL;
}

FREObject ANXCrashlyticsUninstallCallbacks(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return NULL;
}

#pragma mark ContextInitialize/ContextFinalizer

void ANXCrashlyticsContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"ANXCrashlyticsContextInitializer");
    
    *numFunctionsToTest = 16;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToTest));
    
    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &ANXCrashlyticsIsSupported;
    
    func[1].name = (const uint8_t*) "apiKey";
    func[1].functionData = NULL;
    func[1].function = &ANXCrashlyticsAPIKey;
    
    func[2].name = (const uint8_t*) "version";
    func[2].functionData = NULL;
    func[2].function = &ANXCrashlyticsVersion;
    
    func[3].name = (const uint8_t*) "log";
    func[3].functionData = NULL;
    func[3].function = &ANXCrashlyticsLog;
    
    func[4].name = (const uint8_t*) "crash";
    func[4].functionData = NULL;
    func[4].function = &ANXCrashlyticsCrash;
    
    func[5].name = (const uint8_t*) "GetDebug";
    func[5].functionData = NULL;
    func[5].function = &ANXCrashlyticsGetDebug;
    
    func[6].name = (const uint8_t*) "SetDebug";
    func[6].functionData = NULL;
    func[6].function = &ANXCrashlyticsSetDebug;
    
    func[7].name = (const uint8_t*) "setUserIdentifier";
    func[7].functionData = NULL;
    func[7].function = &ANXCrashlyticsSetUserIdentifier;
    
    func[8].name = (const uint8_t*) "setUserName";
    func[8].functionData = NULL;
    func[8].function = &ANXCrashlyticsSetUserName;
    
    func[9].name = (const uint8_t*) "setuserEmail";
    func[9].functionData = NULL;
    func[9].function = &ANXCrashlyticsSetUserEmail;
    
    func[10].name = (const uint8_t*) "setObjectValue";
    func[10].functionData = NULL;
    func[10].function = &ANXCrashlyticsSetObjectValue;
    
    func[11].name = (const uint8_t*) "setIntValue";
    func[11].functionData = NULL;
    func[11].function = &ANXCrashlyticsSetIntValue;
    
    func[12].name = (const uint8_t*) "setBoolValue";
    func[12].functionData = NULL;
    func[12].function = &ANXCrashlyticsSetBoolValue;
    
    func[13].name = (const uint8_t*) "setFloatValue";
    func[13].functionData = NULL;
    func[13].function = &ANXCrashlyticsSetFloatValue;
    
    func[14].name = (const uint8_t*) "installCallbacks";
    func[14].functionData = NULL;
    func[14].function = &ANXCrashlyticsInstallCallbacks;
    
    func[15].name = (const uint8_t*) "uninstallCallbacks";
    func[15].functionData = NULL;
    func[15].function = &ANXCrashlyticsUninstallCallbacks;
    
    *functionsToSet = func;
}

void ANXCrashlyticsContextFinalizer(FREContext ctx)
{
    NSLog(@"ANXCrashlyticsContextFinalizer");
}

#pragma mark Initializer/Finalizer

void ANXCrashlyticsInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    NSLog(@"ANXCrashlyticsInitializer");
    
    *extDataToSet = NULL;
    
    *ctxInitializerToSet = &ANXCrashlyticsContextInitializer;
    *ctxFinalizerToSet = &ANXCrashlyticsContextFinalizer;
}

void ANXCrashlyticsFinalizer(void* extData)
{
    NSLog(@"ANXCrashlyticsFinalizer");
}