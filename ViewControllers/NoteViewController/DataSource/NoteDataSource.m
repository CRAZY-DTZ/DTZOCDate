//
//  NoteDataSource.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/16.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "NoteDataSource.h"
#import "NoteCell.h"

@implementation NoteDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //返回笔记的数组的Count
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建自定义Cell
    static NSString * certif = @"NoteCell";
    UINib * nib = [UINib nibWithNibName:certif bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:certif];
    NoteCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
    if ( cell == nil ) {
        cell = [[NoteCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
    }
    return cell;
}

@end
