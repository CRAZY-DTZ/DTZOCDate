//
//  AdsBookModel.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactModel.h"


typedef void (^ DtzSuccessBlock)(NSMutableArray *successBlock);
typedef void (^ DtzFailBlock)(NSMutableArray *failBlock);

@interface AdsBookModel : NSObject

- (id)init;

- (void)getPersonWithDtzSuccessBlock:(DtzSuccessBlock)dtzSuccessBlock DtzFailBlock:(DtzFailBlock)dtzFailBlock;

@end
