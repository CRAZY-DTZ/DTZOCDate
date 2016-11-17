//
//  SmTableviewDelegate.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/22.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "SmTableviewDelegate.h"
#import "ScheduleCell.h"
#import "SdCell.h"

@implementation SmTableviewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //如果是Section0则是schedule
    if (indexPath.section == 0) {
        static NSString * certif = @"ScheduleCell";
        UINib * nib = [UINib nibWithNibName:certif bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:certif];
        ScheduleCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if (cell == nil) {
            cell = [[ScheduleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        
        return cell;
    }else if (indexPath.section == 1) {
        // 设置
        static NSString * certif = @"ScheduleCell";
        UINib * nib = [UINib nibWithNibName:certif bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:certif];
        ScheduleCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if (cell == nil) {
            cell = [[ScheduleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        return cell;
    }else {
        static NSString * certif = @"SdCell";
        UINib * nib = [UINib nibWithNibName:certif bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:certif];
        SdCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if (cell == nil) {
            cell = [[SdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        cell.tag = indexPath.row;
        return cell;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }else if (section == 1) {
        return 1;
    }else {
        return 1;
    }
    return 20;
}

@end
