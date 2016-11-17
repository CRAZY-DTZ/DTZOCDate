//
//  SelfSdFirstCell.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/23.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "SelfSdFirstCell.h"

@implementation SelfSdFirstCell{
    IBOutlet UIView *_cornerBackgroundView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, winSize.size.width - 26, 60)
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(10.0f, 10.0f)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, 430, 60);
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
