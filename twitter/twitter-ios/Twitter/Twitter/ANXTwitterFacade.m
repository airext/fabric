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

#pragma mark API

FREObject ANXTwitterIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return [ANXFabricConversionRoutines convertBoolToFREObject: YES];
}

FREObject ANXTwitterVersion(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    return [ANXFabricConversionRoutines convertNSStringToFREObject:[Twitter sharedInstance].version];
}

#pragma mark Twitter

FREObject ANXTwitterStartWith(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXTwitterStartWith");
    
    if (argc == 2)
    {
        NSString* consumerKey = [ANXFabricConversionRoutines convertFREObjectToNSString:argv[0]];
        NSString* consumerSecret = [ANXFabricConversionRoutines convertFREObjectToNSString:argv[1]];
        
        [[Twitter sharedInstance] startWithConsumerKey:consumerKey consumerSecret:consumerSecret];
    }
    
    return NULL;
}

FREObject ANXTwitterGetConsumerKey(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXTwitterGetConsumerKey");
    
    return [ANXFabricConversionRoutines convertNSStringToFREObject:[Twitter sharedInstance].consumerKey];
}

FREObject ANXTwitterGetConsumerSecret(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXTwitterGetConsumerSecret");
    
    return [ANXFabricConversionRoutines convertNSStringToFREObject:[Twitter sharedInstance].consumerSecret];
}

FREObject ANXTwitterLogin(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXTwitterLogin");
    
    ANXBridgeCall* call = [ANXBridge call:context];
    
    [[Twitter sharedInstance] logInWithCompletion:
        ^(TWTRSession *session, NSError *error)
        {
            if (session)
            {
                NSLog(@"ANXTwitterLogin: %@", session.userName);
                
                [call result: [[ANXTwitterSession alloc] init:session]];
            }
            else
            {
                NSLog(@"ANXTwitterLogin: Error");
                
                [call reject:error];
            }
        }];
    
    return [call toFREObject];
}

FREObject ANXTwitterLogout(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXTwitterLogout");
    
    [[Twitter sharedInstance] logOut];
    
    return NULL;
}

FREObject ANXTwitterGetSession(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXTwitterGetSession");
    
    ANXTwitterSession *session = [[ANXTwitterSession alloc] init:[[Twitter sharedInstance] session]];
    
    return [session toFREObject];
}

FREObject ANXTwitterLoginGuest(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXTwitterLoginGuest");
    
    ANXBridgeCall* call = [ANXBridge call:context];
    
    [[Twitter sharedInstance] logInGuestWithCompletion:
        ^(TWTRGuestSession *session, NSError *error)
        {
            if (session)
            {
                NSLog(@"ANXTwitterLoginGuest: %@", session);
                
                [call result: [[ANXTwitterGuestSession alloc] init:session]];
            }
            else
            {
                NSLog(@"ANXTwitterLoginGuest: Error");
                
                [call reject:error];
            }
        }];

    return [call toFREObject];
}

FREObject ANXTwitterLogoutGuest(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXTwitterLogoutGuest");
    
    [[Twitter sharedInstance] logOutGuest];
    
    return NULL;
}

FREObject ANXTwitterGetGuestSession(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXTwitterGetGuestSession");
    
    ANXTwitterGuestSession *session = [[ANXTwitterGuestSession alloc] init:[[Twitter sharedInstance] guestSession]];
    
    return [session toFREObject];
}

#pragma mark Digits

FREObject ANXDigitsAuthenticate(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXDigitsAuthenticate");
    
    ANXBridgeCall* call = [ANXBridge call:context];
    
    if (argc == 0)
    {
        [[Digits sharedInstance] authenticateWithCompletion:
            ^(DGTSession *session, NSError *error)
            {
                if (session)
                {
                    [call result: [[ANXDigitsSession alloc] init:session]];
                }
                else
                {
                    [call reject:error];
                }
            
            }];
    }
    else // argc >= 0
    {
        NSString *title = [ANXFabricConversionRoutines convertFREObjectToNSString:argv[0]];
        
        [[Digits sharedInstance] authenticateWithTitle:title completion:
            ^(DGTSession *session, NSError *error)
            {
                if (session)
                {
                    [call result: [[ANXDigitsSession alloc] init:session]];
                }
                else
                {
                    [call reject:error];
                }
            }];
    }
    
    return [call toFREObject];
}

FREObject ANXDigitsLogout(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXDigitsLogout");
    
    [[Digits sharedInstance] logOut];
    
    return NULL;
}

#pragma mark ContextInitialize/ContextFinalizer

void ANXTwitterContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"ANXTwitterContextInitializer");
    
    *numFunctionsToTest = 13;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToTest));
    
    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &ANXTwitterIsSupported;
    
    func[1].name = (const uint8_t*) "version";
    func[1].functionData = NULL;
    func[1].function = &ANXTwitterVersion;
    
    func[2].name = (const uint8_t*) "startWith";
    func[2].functionData = NULL;
    func[2].function = &ANXTwitterStartWith;
    
    func[3].name = (const uint8_t*) "getConsumerKey";
    func[3].functionData = NULL;
    func[3].function = &ANXTwitterGetConsumerKey;
    
    func[4].name = (const uint8_t*) "getConsumerSecret";
    func[4].functionData = NULL;
    func[4].function = &ANXTwitterGetConsumerSecret;
    
    func[5].name = (const uint8_t*) "login";
    func[5].functionData = NULL;
    func[5].function = &ANXTwitterLogin;
    
    func[6].name = (const uint8_t*) "logout";
    func[6].functionData = NULL;
    func[6].function = &ANXTwitterLogout;
    
    func[7].name = (const uint8_t*) "getSession";
    func[7].functionData = NULL;
    func[7].function = &ANXTwitterGetSession;
    
    func[8].name = (const uint8_t*) "loginGuest";
    func[8].functionData = NULL;
    func[8].function = &ANXTwitterLoginGuest;
    
    func[9].name = (const uint8_t*) "logoutGuest";
    func[9].functionData = NULL;
    func[9].function = &ANXTwitterLogoutGuest;
    
    func[10].name = (const uint8_t*) "getGuestSession";
    func[10].functionData = NULL;
    func[10].function = &ANXTwitterGetGuestSession;
    
    func[11].name = (const uint8_t*) "digitsAuthenticate";
    func[11].functionData = NULL;
    func[11].function = &ANXDigitsAuthenticate;
    
    func[12].name = (const uint8_t*) "digitsLogout";
    func[12].functionData = NULL;
    func[12].function = &ANXDigitsLogout;
    
    [ANXBridge setup:numFunctionsToTest functions:&func];

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

void ANXTwitterFinalizer(void* extData)
{
    NSLog(@"ANXTwitterFinalizer");
}