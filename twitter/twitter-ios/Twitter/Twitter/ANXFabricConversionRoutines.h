//
//  ANXFabricConversionRoutines.h
//  Fabric
//
//  Created by Max Rozdobudko on 11/4/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

@interface ANXFabricConversionRoutines : NSObject

+(FREObject) convertBoolToFREObject: (BOOL) value;
+(BOOL) convertFREObjectToBool: (FREObject) value;

+(FREObject) convertNSStringToFREObject: (NSString*) string;
+(NSString*) convertFREObjectToNSString: (FREObject) string;

@end
