//
//  AvatarCell.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/28.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "AvatarCell.h"

@implementation AvatarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.avatarImageView.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
