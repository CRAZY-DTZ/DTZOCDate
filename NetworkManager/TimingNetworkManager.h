//
//  TimingNetworkManager.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/11/18.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface TimingNetworkManager : NSObject

- (id)init;

+ (TimingNetworkManager *)sharedInstance;

@property (strong, nonatomic) AFHTTPRequestOperationManager * httpManager;

@end
