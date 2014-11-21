//
//  Twitter.m
//  Twitter
//
//  Created by Max Rozdobudko on 11/10/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXTwitterFacade.h"

@implementation ANXTwitterFacade

@end

FREObject ANXTwitterIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return [ANXFabricConversionRoutines convertBoolToFREObject: YES];
}

FREObject ANXTwitterLogin(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    [Twitter sharedInstance];
    
    return NULL;
}

FREObject ANXTwitterLogout(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return NULL;
}


FREObject ANXTwitterLoginGuest(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return NULL;
}

FREObject ANXTwitterLogoutGuest(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return NULL;
}

#pragma mark ContextInitialize/ContextFinalizer

void ANXTwitterContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"ANXTwitterContextInitializer");
    
    *numFunctionsToTest = 5;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToTest));
    
    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &ANXTwitterIsSupported;
    
    func[1].name = (const uint8_t*) "login";
    func[1].functionData = NULL;
    func[1].function = &ANXTwitterLogin;
    
    func[2].name = (const uint8_t*) "logout";
    func[2].functionData = NULL;
    func[2].function = &ANXTwitterLogout;
    
    func[3].name = (const uint8_t*) "loginGuest";
    func[3].functionData = NULL;
    func[3].function = &ANXTwitterLoginGuest;
    
    func[4].name = (const uint8_t*) "logoutGuest";
    func[4].functionData = NULL;
    func[4].function = &ANXTwitterLogoutGuest;

    *functionsToSet = func;
}

void ANXTwitterContextFinalizer(FREContext ctx)
{
    NSLog(@"ANXTwitterContextFinalizer");
}

#pragma mark Initializer/Finalizer

void ANXTwitterInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    NSLog(@"ANXTwitterInitializer");
    
    *extDataToSet = NULL;
    
    *ctxInitializerToSet = &ANXTwitterContextInitializer;
    *ctxFinalizerToSet = &ANXTwitterContextFinalizer;
}

void ANTwitterFinalizer(void* extData)
{
    NSLog(@"ANTwitterFinalizer");
}