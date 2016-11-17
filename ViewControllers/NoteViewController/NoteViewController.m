//
//  NoteViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/16.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "NoteViewController.h"
#import "NoteDataSource.h"

@interface NoteViewController () {
    
    NoteDataSource * _noteDataSource;
    
    IBOutlet UITableView *_noteTableView;
}

@end

@implementation NoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadInputViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (void)setupTableView {
    _noteDataSource = [[NoteDataSource alloc]init];
    _noteTableView.dataSource = _noteDataSource;
    _noteTableView.delegate = self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //用push的形式 跳转到新的 具体的noteviewcontroller 隐藏navigationBar
    
}

@end
