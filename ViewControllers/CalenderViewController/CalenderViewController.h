//
//  CalenderViewController.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CalendarViewControllerDelegate <NSObject>

@optional
- (void)goBackClick;

@end

@interface CalenderViewController : UIViewController

@property (strong, nonatomic) id<CalendarViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UINavigationBar *calendarNavBar;

@end
