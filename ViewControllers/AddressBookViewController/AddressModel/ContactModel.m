//
//  ContactModel.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/20.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "ContactModel.h"

@implementation ContactModel

//重写 init 方法

- (id)init {
    self = [super init];
    self.mobilePhonesArray = [[NSMutableArray alloc]init];
    return self;
}


@end
