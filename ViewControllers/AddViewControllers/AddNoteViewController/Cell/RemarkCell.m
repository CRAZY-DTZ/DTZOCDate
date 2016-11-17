//
//  RemarkCell.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/29.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "RemarkCell.h"

@implementation RemarkCell 

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.remarkTextView.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - textView Delegate
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.remarkTextView.text.length == 0) {
        self.remarkLabel.hidden = NO;
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.remarkLabel.hidden = YES;
}

@end
