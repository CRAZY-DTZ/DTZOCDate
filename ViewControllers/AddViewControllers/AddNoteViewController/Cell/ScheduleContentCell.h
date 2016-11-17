//
//  ScheduleContentCell.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/29.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScheduleTextFieldDelegate <NSObject>

@optional

@end

@interface ScheduleContentCell : UITableViewCell <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *contentTextField;

@property (strong, nonatomic) id<ScheduleTextFieldDelegate> delegate;

@end
