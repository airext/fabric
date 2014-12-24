//
//  ANXBridge.h
//  Bridge
//
//  Created by Max Rozdobudko on 12/24/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#include "ANXBridgeCall.h"

@interface ANXBridge : NSObject

+(BOOL) setup: (uint32_t*) numFunctionsToSet functions: (FRENamedFunction**) functionsToSet;

+(ANXBridgeCall*) call: (FREContext) context;

@end
