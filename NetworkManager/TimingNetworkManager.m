//
//  TimingNetworkManager.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/11/18.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "TimingNetworkManager.h"

#define NULL_TO_NIL(obj) ({ __typeof__ (obj) __obj = (obj); __obj == [NSNull null] ? nil : obj; })

@implementation TimingNetworkManager

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

+ (TimingNetworkManager *)sharedInstance {
    static TimingNetworkManager * _instance = nil;
    @synchronized (self) {
        if (!_instance) {
            _instance = [[TimingNetworkManager alloc]
                         init];
            _instance.httpManager = [[AFHTTPRequestOperationManager alloc]init];
            // 设置超时时间
            [_instance.httpManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
            _instance.httpManager.requestSerializer.timeoutInterval = 5.0f;
            [_instance.httpManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
            return _instance;
        }
    }
    return _instance;
}


@end
