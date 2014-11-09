//
//  ANXFabricFacade.m
//  Fabric
//
//  Created by Max Rozdobudko on 11/4/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXFabricFacade.h"
#import "ANXFabricConversionRoutines.h"

@implementation ANXFabricFacade

@end

#pragma mark API

FREObject ANXFabricIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXFabricIsSupported");
    
    return [ANXFabricConversionRoutines convertBoolToFREObject:YES];
}

FREObject ANXFabricWith(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSMutableArray *kits = [NSMutableArray array];
    
    for (uint32_t i = 0; i < argc; i++)
    {
        NSString *kitName = [ANXFabricConversionRoutines convertFREObjectToNSString:argv[i]];
        
        if (kitName)
        {
            Class kitClass = NSClassFromString(kitName);
            
            if (kitClass)
            {
                @try
                {
                    id kit = [[kitClass alloc] init];
                    
                    [kits addObject:kit];
                }
                @catch (NSException *exception)
                {
                    NSLog(@"[Fabric] Warning: %@", exception.description);
                }
            }
        }
    }
    
    NSLog(@"ANXFabricWith: %@", kits);
    
    @try
    {
        [Fabric with:kits];
    }
    @catch (NSException *exception)
    {
        NSLog(@"[Fabric] Warning: %@", exception.description);
    }
    
    return NULL;
}

FREObject ANXFabricSetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    [Fabric sharedSDK].debug = [ANXFabricConversionRoutines convertFREObjectToBool:argv[0]];
    
    return NULL;
}

FREObject ANXFabricGetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return [ANXFabricConversionRoutines convertBoolToFREObject:[Fabric sharedSDK].debug];
}

#pragma mark ContextInitialize/ContextFinalizer

void ANXFabricContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"ANXFabricContextInitializer");

    *numFunctionsToTest = 4;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToTest));
    
    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &ANXFabricIsSupported;
    
    func[1].name = (const uint8_t*) "with";
    func[1].functionData = NULL;
    func[1].function = &ANXFabricWith;
    
    func[2].name = (const uint8_t*) "setDebug";
    func[2].functionData = NULL;
    func[2].function = &ANXFabricSetDebug;
    
    func[3].name = (const uint8_t*) "getDebug";
    func[3].functionData = NULL;
    func[3].function = &ANXFabricGetDebug;
    
    *functionsToSet = func;
}

void ANXFabricContextFinalizer(FREContext ctx)
{
    NSLog(@"ANXFabricContextFinalizer");
}

#pragma mark Initializer/Finalizer

void ANXFabricInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    NSLog(@"ANXFabricInitializer");
    
    *extDataToSet = NULL;
    
    *ctxInitializerToSet = &ANXFabricContextInitializer;
    *ctxFinalizerToSet = &ANXFabricContextFinalizer;
}

void ANXFabricFinalizer(void* extData)
{
    NSLog(@"ANXFabricFinalizer");
}
