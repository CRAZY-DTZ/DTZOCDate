//
//  CalCell.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/21.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *timeDetailLabel;

@property (strong, nonatomic) IBOutlet UILabel *eventTitleLabel;

@end
