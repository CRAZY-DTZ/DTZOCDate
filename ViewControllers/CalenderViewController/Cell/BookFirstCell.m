//
//  BookFirstCell.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/27.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "BookFirstCell.h"

@implementation BookFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 12.0;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
