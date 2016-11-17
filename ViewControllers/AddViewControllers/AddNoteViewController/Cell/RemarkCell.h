//
//  RemarkCell.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/29.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RemarkCellDelegate <NSObject>

@optional


@end

@interface RemarkCell : UITableViewCell <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *remarkTextView;

@property (strong, nonatomic) IBOutlet UILabel *remarkLabel;

@property (strong, nonatomic) id<RemarkCellDelegate> delegate;

@end
