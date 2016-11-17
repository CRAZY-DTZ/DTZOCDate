//
//  ScheduleViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleDataSource.h"
#import "DTZTransitioning.h"
#import "SdCell.h"
#import "CalenderViewController.h"
#import "NoteViewController.h"
#import "SecondViewController.h"
#import "SMTableViewDataSource.h"
#import <Masonry.h>

#define winSize [[UIScreen mainScreen]bounds]

@interface ScheduleViewController () <UITableViewDelegate> {
    UITableView *_scheduleTableView;
    ScheduleDataSource * _dataSource;
    DTZTransitioning * _dtzTransitioning;
    IBOutlet UITableView * _smTableView;
    SMTableViewDataSource * _smDataSource;
    
    IBOutlet UILabel *_typeLabel;
    
    IBOutlet UILabel *_personalSignature;
    
    IBOutlet UIImageView *_avatarImageView;
    
    

}

@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的行程";
    self.navigationController.navigationBar.hidden = YES;
    [self setTableviewHeaderView];
    [self setTableView];
    [self setCornerRadius];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - setAvatarCornerRadius 
- (void)setCornerRadius {
    _avatarImageView.layer.cornerRadius = 30.0f;
}

#pragma mark - tableview Headerview
- (void)setTableviewHeaderView {
    UIView * tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, winSize.size.width - 40, 100)];
    
    
    _typeLabel = [[UILabel alloc]init];
    _typeLabel.text = @"我的行程";
    _typeLabel.font = [UIFont systemFontOfSize:25.0f];
    _typeLabel.textColor = [UIColor blackColor];
    [tableHeaderView addSubview:_typeLabel];
    
    _personalSignature = [[UILabel alloc]init];
    _personalSignature.text = @"DTZ . 咖喱给给";
    _personalSignature.textColor = [UIColor lightGrayColor];
    _personalSignature.font = [UIFont systemFontOfSize:17.0f];
    [tableHeaderView addSubview:_personalSignature];
    
    _avatarImageView = [[UIImageView alloc]init];
    _avatarImageView.image = [UIImage imageNamed:@"XXXXX"];
    _avatarImageView.layer.cornerRadius = 12.0f;
    [tableHeaderView addSubview:_avatarImageView];
    
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tableHeaderView.mas_left).offset(0.0);
        make.top.equalTo(tableHeaderView.mas_top).offset(10);
    }];
    
    [_personalSignature mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tableHeaderView.mas_left).offset(0.0f);
        make.top.equalTo(_typeLabel.mas_bottom).offset(10.0f);
    }];
    
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(tableHeaderView.mas_right).offset(0.0f);
        make.top.equalTo(tableHeaderView.mas_top).offset(10.0f);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    _smTableView.tableHeaderView = tableHeaderView;
}

#pragma mark - setTableView 
- (void)setTableView {
    //初始化 切换mode 情况下的tableview
    _dataSource = [[ScheduleDataSource alloc]init];
    _smTableView.delegate = self;
    _smTableView.backgroundColor = [UIColor clearColor];
    _smTableView.showsVerticalScrollIndicator = NO;
    
    _smTableView.dataSource = _dataSource;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 56.0f;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}

@end
