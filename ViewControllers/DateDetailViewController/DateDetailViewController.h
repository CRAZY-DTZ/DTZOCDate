//
//  DateDetailViewController.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/22.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *eventTitleLabel;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UITextView *detailTextView;

@end
