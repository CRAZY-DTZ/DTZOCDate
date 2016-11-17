//
//  TestCell.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/15.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell

//没有通知 没有提醒 自己看的
@property (strong, nonatomic) IBOutlet UILabel *noteTitle;

@property (strong, nonatomic) IBOutlet UILabel *noteDetail;

@end
