//
//  ANXTwitterSession.h
//  Twitter
//
//  Created by Max Rozdobudko on 12/12/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TwitterKit/TwitterKit.h>

#import "FlashRuntimeExtensions.h"

#import "ANXFabricConversionRoutines.h"

@interface ANXTwitterSession : NSObject

-(id) init: (TWTRSession*) session;

@property TWTRSession* originalSession;

-(FREObject) toFREObject;

@end
