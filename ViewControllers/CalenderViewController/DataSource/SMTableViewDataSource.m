//
//  SMTableViewDataSource.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/22.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "SMTableViewDataSource.h"
#import "ScheduleCell.h"
#import "SdCell.h"
#import "SelfSdFirstCell.h"
#import "BookFirstCell.h"
#import "SelfSdLastCell.h"


@implementation SMTableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //section的 cell 的tag 为2 为了转场动画设置.
    //如果是Section0则是schedule
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString * certif = @"SelfSdFirstCell";
            UINib * nib = [UINib nibWithNibName:certif bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:certif];
            SelfSdFirstCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
            if (cell == nil) {
                cell = [[SelfSdFirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
            }
            return cell;
        }
        
        if (indexPath.row == 3) {
            //最后一个Cell
            static NSString * certif = @"SelfSdLastCell";
            UINib * nib = [UINib nibWithNibName:certif bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:certif];
            SelfSdLastCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
            if (cell == nil) {
                cell = [[SelfSdLastCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
            }
            cell.corneerView.layer.cornerRadius = 12.0f;
            return cell;
        }
        static NSString * certif = @"ScheduleCell";
        UINib * nib = [UINib nibWithNibName:certif bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:certif];
        ScheduleCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if (cell == nil) {
            cell = [[ScheduleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        cell.tag = 0;
        
        return cell;
    }else if (indexPath.section == 1) {
        // 设置
        static NSString * certif = @"BookFirstCell";
        UINib * nib = [UINib nibWithNibName:certif bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:certif];
        BookFirstCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if (cell == nil) {
            cell = [[BookFirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        cell.tag = 1;
        cell.cornerView.layer.cornerRadius = 10;
        return cell;
    }else {
        static NSString * certif = @"SdCell";
        UINib * nib = [UINib nibWithNibName:certif bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:certif];
        SdCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if (cell == nil) {
            cell = [[SdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        cell.tag = 2;
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
