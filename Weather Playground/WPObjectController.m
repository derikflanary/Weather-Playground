//
//  WPObjectController.m
//  Weather Playground
//
//  Created by Derik Flanary on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WPObjectController.h"
#import "NetworkController.h"

@implementation WPObjectController

+ (WPObjectController *)sharedInstance {
    static WPObjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WPObjectController new];
    });
    return sharedInstance;
}

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(Weather *weather))completion{
    
    NSString *path = [NSString stringWithFormat:@"weather?q=%@", name];
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseWeather = responseObject;
        
        Weather *weather;
        //NSMutableArray *weatherInfo = [NSMutableArray new];
        //for (NSDictionary *dictionary in responseWeather) {
            weather = [[Weather alloc]initWithDictionary:responseWeather];
       // }
        //Weather *weather = weatherInfo.firstObject;
        completion(weather);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        completion(nil);
    }];
}
@end
