//
//  UpdateViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/30.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "UpdateViewController.h"
#import "UpdateCell.h"

@interface UpdateViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate> {
    IBOutlet UITableView *_updateTableView;
    NSString * _nickname;
    NSString * _address;
    NSString * _simpleintroduction;
}

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - get original info
- (void)getOriginalPersonalInfo {
    
}

#pragma mark - tableview delegate 
- (void)setTableView {
    _updateTableView.delegate = self;
    _updateTableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * certif = @"UpdateCell";
    UINib * nib = [UINib nibWithNibName:certif bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:certif];
    UpdateCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
    if (cell == nil) {
        cell = [[UpdateCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
    }
    cell.updateTextField.delegate = self;
    [cell.updateTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    return cell;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

- (void)textFieldDidChange:(id)sender {
    
}

@end
