//
//  ABDataSource.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ABDataSource : NSObject <UITableViewDataSource>


- (id)init;

@property (strong, nonatomic) NSMutableArray * contactsArray;

@end
