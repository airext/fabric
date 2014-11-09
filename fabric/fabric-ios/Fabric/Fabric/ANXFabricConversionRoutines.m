//
//  ANXFabricConversionRoutines.m
//  Fabric
//
//  Created by Max Rozdobudko on 11/4/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXFabricConversionRoutines.h"

@implementation ANXFabricConversionRoutines

+(FREObject) convertBoolToFREObject: (BOOL) value
{
    FREObject result = NULL;
    
    if (value)
        FRENewObjectFromBool((uint32_t) 1, &result);
    else
        FRENewObjectFromBool((uint32_t) 0, &result);
    
    return result;
}

+(BOOL) convertFREObjectToBool: (FREObject) value
{
    uint32_t tempValue;
    
    FREResult result = FREGetObjectAsBool(value, &tempValue);
    
    if (result != FRE_OK)
        return NO;
    
    return tempValue > 0;
}

+(FREObject) convertNSStringToFREObject:(NSString*) string
{
    if (string == nil) return NULL;
    
    const char* utf8String = string.UTF8String;
    
    unsigned long length = strlen( utf8String );
    
    FREObject converted;
    FREResult result = FRENewObjectFromUTF8((uint32_t) length + 1, (const uint8_t*) utf8String, &converted);
    
    if (result != FRE_OK)
        return NULL;
    
    return converted;
}

+(NSString*) convertFREObjectToNSString: (FREObject) string
{
    FREResult result;
    
    uint32_t length = 0;
    const uint8_t* tempValue = NULL;
    
    result = FREGetObjectAsUTF8(string, &length, &tempValue);
    
    if (result != FRE_OK)
        return nil;
    
    NSString *value = [NSString stringWithUTF8String: (const char*) tempValue];
    
    return value;
}

@end
