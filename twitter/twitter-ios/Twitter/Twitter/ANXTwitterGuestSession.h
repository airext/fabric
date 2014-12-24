//
//  ANXTwitterGuestSession.h
//  Twitter
//
//  Created by Max Rozdobudko on 12/12/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TwitterKit/TwitterKit.h>

#import "FlashRuntimeExtensions.h"

#import "ANXFabricConversionRoutines.h"

@interface ANXTwitterGuestSession : NSObject

-(id) init: (TWTRGuestSession*) session;

@property TWTRGuestSession* originalSession;

-(FREObject) toFREObject;

@end
