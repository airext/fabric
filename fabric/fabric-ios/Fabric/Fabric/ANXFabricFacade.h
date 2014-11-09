//
//  ANXFabricFacade.h
//  Fabric
//
//  Created by Max Rozdobudko on 11/4/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Fabric/Fabric.h>

#import "FlashRuntimeExtensions.h"

@interface ANXFabricFacade : NSObject

@end

#pragma mark API

FREObject ANXFabricIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXFabricWith(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXFabricSetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXFabricGetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

#pragma mark ContextInitialize/ContextFinalizer

void ANXFabricContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);

void ANXFabricContextFinalizer(FREContext ctx);

#pragma mark Initializer/Finalizer

void ANXFabricInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);

void ANXFabricFinalizer(void* extData);
