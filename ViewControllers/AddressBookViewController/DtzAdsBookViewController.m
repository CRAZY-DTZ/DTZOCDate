//
//  DtzAdsBookViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "DtzAdsBookViewController.h"
#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import "ABDataSource.h"
#import "AdsBookModel.h"

#define winSize [[UIScreen mainScreen]bounds]

@interface DtzAdsBookViewController ()<UITableViewDelegate> {
    
    IBOutlet UITableView *_adsTableView;
    ABDataSource * _dataSource;
    AdsBookModel * _adsBookModel;
    NSMutableArray * contactsArray;
    
    UIView * _headerView;
}

@end

@implementation DtzAdsBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    [self setAddressModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableHeaderView
- (void)setTableHeaderView {
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, winSize.size.width, 100)];
    //添加六边形的头像和nickname
    _adsTableView.tableHeaderView = _headerView;
}

- (void)setImageView {
    
}

#pragma mark - AdsBookModel initialization
- (void)setAddressModel {
    _adsBookModel = [[AdsBookModel alloc]init];
    //由于通讯录可能有更新新的内容，所以还是不需要备份 而且一定要以通讯录作为基础 所以不需要备份到服务器 。
    [_adsBookModel getPersonWithDtzSuccessBlock:^(NSMutableArray *successBlock) {
        contactsArray = successBlock;
        _dataSource.contactsArray = successBlock;
        [_adsTableView reloadData];
    } DtzFailBlock:^(NSMutableArray *failBlock) {
        
    }];
}

#pragma mark - tableview delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //跳转到 个人通讯录详情.
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (void)setTableView {
    _dataSource = [[ABDataSource alloc]init];
    _adsTableView.delegate = self;
    _adsTableView.dataSource = _dataSource;
}


@end
