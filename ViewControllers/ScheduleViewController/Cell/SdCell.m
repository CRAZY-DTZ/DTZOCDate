//
//  SdCell.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "SdCell.h"
#import "TestCell.h"

@implementation SdCell {
    IBOutlet UITableView *_cellTableViwe;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.masksToBounds = true;
    self.layer.cornerRadius = 12.0;
    [self setupTableView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setLabels {
    
}

#pragma mark tableview delegate && datasource
- (void)setupTableView {
    _cellTableViwe.delegate = self;
    _cellTableViwe.dataSource = self;
    _cellTableViwe.layer.masksToBounds = YES;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

@end

