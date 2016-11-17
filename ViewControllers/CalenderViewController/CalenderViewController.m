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

#define winSize [[UIScreen mainScreen]bounds]

@interface CalenderViewController ()<FSCalendarDataSource,FSCalendarDelegate,UITableViewDelegate,UITableViewDataSource>{
    FSCalendar *_calendar;
    UITableView *_scheduleTableView;
    UITableView * _smTableView;
    SMTableViewDataSource * _smDataSource;
    DTZTransitioning * _dtzTransitioning;
    IBOutlet UIBarButtonItem *_addItem;
    IBOutlet UIBarButtonItem *_switchItem;
    IBOutlet UINavigationBar *_navigationBar;
}

@end

@implementation CalenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"日历";
    [self setNavigationItem];
    //ios7.0以上的机型,设置navigationBar,不挡住viewcontroller的view
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [_navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    _navigationBar.shadowImage = [UIImage new];
    _navigationBar.translucent = YES;
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
    _calendar = [[FSCalendar alloc]initWithFrame:CGRectMake(0, 64, winSize.size.width, winSize.size.height/5*3)];
    _calendar.dataSource = self;
    _calendar.delegate = self;
    _calendar.appearance.eventColor = [UIColor blackColor];
    _calendar.appearance.titleDefaultColor = [UIColor blackColor];
    _calendar.appearance.headerTitleColor = [UIColor blackColor];
    _calendar.appearance.subtitleSelectionColor = [UIColor blackColor];
    _calendar.appearance.weekdayTextColor = [UIColor blackColor];
    [self.view addSubview:_calendar];
    //初始化 日历下的tableview
    //初始化 切换mode 情况下的tableview
    _smTableView = [[UITableView alloc]initWithFrame:CGRectMake(13, 64, winSize.size.width-26, winSize.size.height - 110) style:UITableViewStyleGrouped];
    _smDataSource = [[SMTableViewDataSource alloc]init];
    _smTableView.delegate = self;
    _smTableView.dataSource = _smDataSource;
    _smTableView.hidden = YES;
    _smTableView.layer.masksToBounds = NO;
    _smTableView.scrollEnabled = NO;
    _smTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_smTableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
}

#pragma mark - iboutlet

- (IBAction)addAction:(id)sender {
    //添加选择 添加行程.
    //present 出addNoteViewController
    AddNoteViewController * addNoteVC = [[AddNoteViewController alloc]init];
    [self presentViewController:addNoteVC animated:YES completion:^{
    }];
}

- (IBAction)switchAction:(id)sender {
    if (_calendar.hidden == YES) {
        _calendar.hidden = NO;
        _scheduleTableView.hidden = NO;
        _smTableView.hidden = YES;
    }else {
        _calendar.hidden = YES;
        _scheduleTableView.hidden = YES;
        _smTableView.hidden = NO;
    }

}

#pragma mark - switch view 
- (void)switchViews {
    
}

#pragma mark - setNavigationItem
- (void)setNavigationItem {
    
}

#pragma mark - FSCalendarDelegate
- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - tableView Delegate && DataSource
- (void)setTableView {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if ([tableView.dataSource isKindOfClass:[SMTableViewDataSource class]]) {
        ScheduleViewController * scheduleViewController = [[ScheduleViewController alloc]init];
        scheduleViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:scheduleViewController animated:YES];
    }else {
        //日历mode 下的tableview 跳转到事件详情的界面
        DateDetailViewController * dateDetailViewController = [[DateDetailViewController alloc]init];
        [self.navigationController pushViewController:dateDetailViewController animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * certif = @"CalCell";
    UINib * nib = [UINib nibWithNibName:certif bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:certif];
    CalCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
    if (cell == nil) {
        cell = [[CalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
    }
    cell.eventTitleLabel.textColor = [UIColor whiteColor];
    cell.timeDetailLabel.textColor = [UIColor whiteColor];
    cell.dateLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
