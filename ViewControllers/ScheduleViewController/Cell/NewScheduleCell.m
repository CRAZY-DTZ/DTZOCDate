//
//  NewScheduleCell.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/7/4.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "NewScheduleCell.h"

@implementation NewScheduleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.cornerRadius = 3.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
