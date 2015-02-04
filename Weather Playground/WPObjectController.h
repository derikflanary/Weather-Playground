//
//  WPObjectController.h
//  Weather Playground
//
//  Created by Derik Flanary on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface WPObjectController : NSObject
+ (WPObjectController *)sharedInstance;
-(void)getWeatherWithName:(NSString*)name completion:(void (^)(Weather *weather))completion;
@end
