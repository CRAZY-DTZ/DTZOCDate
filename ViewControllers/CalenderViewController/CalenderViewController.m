//
//  CalenderViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "CalenderViewController.h"
//#import <FSCalendar.h>
#import "FSCalendar.h"
#import "CalCell.h"
#import "SMTableViewDataSource.h"
#import "DTZTransitioning.h"
#import "DateDetailViewController.h"
#import "AddNoteViewController.h"
#import "ScheduleViewController.h"
#import "PersonalViewController.h"

#define winSize [[UIScreen mainScreen]bounds]

@interface CalenderViewController ()<FSCalendarDataSource,FSCalendarDelegate>{
    FSCalendar *_calendar;

    IBOutlet UIView *_calContentView;
    
    IBOutlet UIButton *_settingBtn;
    
    IBOutlet UIButton *_addBtn;
    
    IBOutlet UIButton *_selectorBtn;
    
    IBOutlet UIButton *_messageBtn;
}

@end

@implementation CalenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    //ios7.0以上的机型,设置navigationBar,不挡住viewcontroller的view
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self viewInit];
}

- (void)viewDidAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    self.calendarNavBar.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewInit {
    //初始化日历
    _calendar = [[FSCalendar alloc]initWithFrame:CGRectMake(0, 0, winSize.size.width - 40, winSize.size.height - 124)];
    _calendar.dataSource = self;
    _calendar.delegate = self;
    _calendar.appearance.eventColor = [UIColor blackColor];
    _calendar.appearance.titleDefaultColor = [UIColor blackColor];
    _calendar.appearance.headerTitleColor = [UIColor blackColor];
    _calendar.appearance.subtitleSelectionColor = [UIColor blackColor];
    _calendar.appearance.weekdayTextColor = [UIColor blackColor];
    [_calContentView addSubview:_calendar];
}

#pragma mark - FSCalendarDelegate
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date {
    // 选中了某一天 就是进入到某一天的行程表.
    
}

#pragma mark - iboutlet Action
- (IBAction)addAction:(id)sender {
    //添加选择 添加行程.
    AddNoteViewController * addNoteVC = [[AddNoteViewController alloc]init];
    [self presentViewController:addNoteVC animated:YES completion:^{
    }];
}

- (IBAction)selectAction:(id)sender {
    // 新的界面 添加编辑状态的 界面...
    
}

- (IBAction)settingAction:(id)sender {
    PersonalViewController * personalVC = [[PersonalViewController alloc]init];
    UINavigationController * navigator = [[UINavigationController alloc]initWithRootViewController:personalVC];
    [self.navigationController presentViewController:navigator animated:YES completion:^{
        
    }];
}

- (IBAction)messageAction:(id)sender {
    ScheduleViewController * scheduleVC = [[ScheduleViewController alloc]init];
    UINavigationController * navigator = [[UINavigationController alloc]initWithRootViewController:scheduleVC];
    [self.navigationController presentViewController:navigator animated:YES completion:^{
        
    }];
}

@end
