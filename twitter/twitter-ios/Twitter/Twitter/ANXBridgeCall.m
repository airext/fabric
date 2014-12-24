//
//  ANXBridgeCall.m
//  Twitter
//
//  Created by Max Rozdobudko on 12/11/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXBridgeCall.h"

@implementation ANXBridgeCall

#pragma mark Class variables

static NSMutableArray* asyncCallStack = nil;

#pragma mark Class methods

+(ANXBridgeCall*) create: (FREContext) context
{
    NSLog(@"ANXBridgeCall.created");
    
    if (!asyncCallStack)
        asyncCallStack = [[NSMutableArray alloc] init];
    
    NSLog(@"ANXBridgeCall.created 1");
    
    NSUInteger count = [asyncCallStack count];
    
    ANXBridgeCall* call = [[ANXBridgeCall alloc] init:context callId:count];
    
    NSLog(@"ANXBridgeCall.created 2");
    
    [asyncCallStack addObject: call];
    
    NSLog(@"Call created");
    
    return call;
}

+(void) remove: (ANXBridgeCall*) call
{
    if (!asyncCallStack)
        return;
    
    [asyncCallStack removeObject:call];
}

+(ANXBridgeCall*) obtain: (NSUInteger) anId
{
    if (!asyncCallStack)
        return nil;
    
    if ([asyncCallStack count] <= anId)
        return nil;
    
    @try
    {
        ANXBridgeCall *call = [asyncCallStack objectAtIndex:anId];
        
        return call;
    }
    @catch (NSException *exception)
    {
        return nil;
    }
    @finally{}
}

#pragma mark Constructor

-(id) init: (FREContext) aContext callId: (NSUInteger) aCallId
{
    self = [super init];
    
    self.context = aContext;
    self.callId = aCallId;
    
    return self;
}

#pragma mark Variables

@synthesize context;

@synthesize callId;

@synthesize completionValue;

@synthesize failureReason;

#pragma mark Methods

-(void) result: (id) value
{
    NSLog(@"ANXBridgeCall.result:");
    
    self.completionValue = value;
    
    FREDispatchStatusEventAsync(self.context, (const uint8_t *) "ANXBridgeCallResult", (const uint8_t *) [[NSString stringWithFormat:@"%lu", (unsigned long)self.callId] UTF8String]);
}

-(void) reject: (NSError*) error
{
    NSLog(@"ANXBridgeCall.error:");
    
    self.failureReason = error;
    
    FREDispatchStatusEventAsync(self.context, (const uint8_t *) "ANXBridgeCallReject", (const uint8_t *) [[NSString stringWithFormat:@"%lu", (unsigned long)self.callId] UTF8String]);
}

-(FREObject) toFREObject
{
    FREObject result;
    
    FRENewObjectFromUint32((uint32_t) self.callId, &result);
    
    return result;
}

@end

#pragma mark C API

void ANXBridgeInitializer(uint32_t* numFunctionsToTest, FRENamedFunction** functionsToSet)
{
    NSLog(@"ANXBridgeInitializer");
    
    uint32_t count = *numFunctionsToTest;
    
    *numFunctionsToTest = count + 2;
    
    FRENamedFunction* func = realloc((void *) *functionsToSet, sizeof(FRENamedFunction) * (*numFunctionsToTest));
    
    NSLog(@"blalba: %u, %u", count, count + 1);
    
    func[count].name = (const uint8_t*) "ANXBridgeCallGetValue";
    func[count].functionData = NULL;
    func[count].function = &ANXBridgeCallGetValue;
    
    func[count + 1].name = (const uint8_t*) "ANXBridgeCallGetError";
    func[count + 1].functionData = NULL;
    func[count + 1].function = &ANXBridgeCallGetError;
    
    *functionsToSet = func;
}

FREObject ANXBridgeCallGetValue(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXBridgeCallGetValue");
    
    FREObject result = NULL;
    
    if (argc > 0)
    {
        uint32_t incomingCallId;
        
        FREGetObjectAsUint32(argv[0], &incomingCallId);
        
        ANXBridgeCall *call = [ANXBridgeCall obtain:(NSUInteger) incomingCallId];
        
        if (call)
        {
            if (call.completionValue)
            {
                SEL selector = NSSelectorFromString(@"toFREObject");
                IMP imp = [call.completionValue methodForSelector:selector];
                
                FREObject (*func)(id, SEL) = (void *)imp;
                result = func(call.completionValue, selector);
            }
            
            [ANXBridgeCall remove:call];
        }
    }
    
    return result;
}

FREObject ANXBridgeCallGetError(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    NSLog(@"ANXBridgeCallGetError");
    
    FREObject result = NULL;
    
    NSLog(@"ANXBridgeCallGetError argc: %u", argc);
    
    if (argc > 0)
    {
        uint32_t incomingCallId;
        
        FREGetObjectAsUint32(argv[0], &incomingCallId);
        
        ANXBridgeCall *call = [ANXBridgeCall obtain:(NSUInteger) incomingCallId];
        
        NSLog(@"ANXBridgeCallGetError call: %@", call);
        
        if (call)
        {
            const char* errorDescriptionAsUTF8 = [[call.failureReason description] UTF8String];
            
            unsigned long length = strlen(errorDescriptionAsUTF8);
            
            FREObject errorDescription;
            FRENewObjectFromUTF8((uint32_t) length + 1, (const uint8_t*) errorDescriptionAsUTF8, &errorDescription);
            
            result = errorDescription;
            
            [ANXBridgeCall remove:call];
        }
    }
    
    return result;
}