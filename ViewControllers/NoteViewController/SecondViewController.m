//
//  SecondViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/16.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "SecondViewController.h"
#import "TestCell.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 12.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setLabels {
    
}

#pragma mark tableview delegate && datasource
- (void)setupTableView {
    self.noteTableView.delegate = self;
    self.noteTableView.dataSource = self;
    self.noteTableView.layer.masksToBounds = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * certif = @"TestCell";
    UINib * nib = [UINib nibWithNibName:certif bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:certif];
    TestCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
    if (cell == nil) {
        cell = [[TestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
    }
    cell.selected = false;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //选中了 note . 展示 note
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}


@end
