//
//  ScheduleDataSource.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "ScheduleDataSource.h"
#import "SdCell.h"
#import "ScheduleCell.h"
#import "NewScheduleCell.h"

@implementation ScheduleDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 重新设置cell
    static NSString * certif = @"NewScheduleCell";
    UINib * nib = [UINib nibWithNibName:certif bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:certif];
    NewScheduleCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
    if (cell == nil) {
        cell = [[NewScheduleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
    }
    
    NSInteger x = indexPath.section;
    NSLog(@"%d",(int)x);
    if (x % 3 == 1) {
        cell.titleLabel.text = @"阅读GOGOGO";
        cell.titleLabel.textColor = [UIColor colorWithRed:80.0/255 green:171.0/255 blue:195.0/255 alpha:1];
        [cell.rightBtn setImage:[UIImage imageNamed:@"bookTagIcon"] forState:UIControlStateNormal];
    }else if (x % 3 == 2) {
        cell.titleLabel.text = @"起床了.锤";
        cell.titleLabel.textColor = [UIColor colorWithRed:164.0/255 green:168.0/255 blue:139.0/255 alpha:1];
        [cell.rightBtn setImage:[UIImage imageNamed:@"noteTagIcon"] forState:UIControlStateNormal];
    }
    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

@end
