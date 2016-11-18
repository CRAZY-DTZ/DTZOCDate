//
//  RejMesDetailVC.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/11/18.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "RejMesDetailVC.h"
#import "TitleCell.h"
#import "ContentCell.h"
#import "InviteesCell.h"
#import "AlertCell.h"

@interface RejMesDetailVC ()<UITableViewDelegate,UITableViewDataSource> {
    
    IBOutlet UITableView *_rmdTableview;
    
    IBOutlet UIButton *_deleteBtn;
}

@end

@implementation RejMesDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - navigator Appearence 
- (void)navigatorAppearence {
    self.title = @"Event Details";
}

#pragma mark - iboutlet action 
- (IBAction)deleteAction:(id)sender {
    // delete alertcontroller
    
}

#pragma mark - tableview setting
- (void)tableviewSetting {
    _rmdTableview.dataSource = self;
    _rmdTableview.delegate = self;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        NSString * certif = @"";
        UINib * nib = [UINib nibWithNibName:certif bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:certif];
        
        TitleCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if (cell == nil) {
            cell = [[TitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        
        return cell;
    }else if (indexPath.row == 1) {
        NSString * certif = @"";
        UINib * nib = [UINib nibWithNibName:certif bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:certif];
        ContentCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if (cell == nil) {
            cell = [[ContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        
        return cell;
    }else if (indexPath.row == 2) {
        
    }else if (indexPath.row == 3) {
        
    }else if (indexPath.row == 4) {
        
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
