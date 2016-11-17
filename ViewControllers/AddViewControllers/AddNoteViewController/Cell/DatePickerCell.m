//
//  DatePickerCell.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/30.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "DatePickerCell.h"

@implementation DatePickerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.datePicker.date = [NSDate date];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
