//
//  ANXCrashlyticsConversionRoutines.h
//  Crashlytics
//
//  Created by Max Rozdobudko on 11/5/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

@interface ANXCrashlyticsConversionRoutines : NSObject

+(FREObject) convertBoolToFREObject: (BOOL) value;
+(BOOL) convertFREObjectToBool: (FREObject) value;

+(FREObject) convertNSStringToFREObject:(NSString*) string;
+(NSString*) convertFREObjectToNSString: (FREObject) string;

+(int) convertFREObjectToInt: (FREObject) integer withDefault: (int) defaultValue;

+(float) convertFREObjectToFloat: (FREObject) integer withDefault: (float) defaultValue;

@end