//
//  AddNoteViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/28.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "AddNoteViewController.h"
#import "ScheduleContentCell.h"
#import "StartTimeCell.h"
#import "RemindCell.h"
#import "RemarkCell.h"
#import "InvitingCell.h"
#import "DatePickerCell.h"

@interface AddNoteViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate> {
    IBOutlet UITableView *_addTableView;
    IBOutlet UIBarButtonItem *_leftItem;
    IBOutlet UIBarButtonItem *_rightItem;
    UIDatePicker * _datePicker;
}

@end

@implementation AddNoteViewController

- (id)init {
    self = [super init];
    self.isPickerCellHidden = YES;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - iboutlet action
- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)completeAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - textField delegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

#pragma mark - tableview delegate && dataSource
- (void)setTableView {
    _addTableView.delegate = self;
    _addTableView.dataSource = self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        // 内容
        static NSString * certif = @"ScheduleContentCell";
        UINib * nib = [UINib nibWithNibName:certif bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:certif];
        ScheduleContentCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if ( cell == nil ) {
            cell = [[ScheduleContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        return cell;
    }else if (indexPath.section == 1) {
        if (self.isPickerCellHidden) {
            if (indexPath.row == 0) {
                static NSString * certif = @"InvitingCell";
                UINib * nib = [UINib nibWithNibName:certif bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:certif];
                InvitingCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
                if (cell == nil) {
                    cell = [[InvitingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
                }
                return cell;
            }else if (indexPath.row == 1) {
                // 开始时间
                static NSString * certif = @"StartTimeCell";
                UINib * nib = [UINib nibWithNibName:certif bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:certif];
                StartTimeCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
                if (cell == nil) {
                    cell = [[StartTimeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
                }
                return cell;
            }
        }else {
            if (indexPath.row == 0) {
                static NSString * certif = @"InvitingCell";
                UINib * nib = [UINib nibWithNibName:certif bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:certif];
                InvitingCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
                if (cell == nil) {
                    cell = [[InvitingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
                }
                return cell;
            }else if (indexPath.row == 1) {
                // 开始时间
                static NSString * certif = @"StartTimeCell";
                UINib * nib = [UINib nibWithNibName:certif bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:certif];
                StartTimeCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
                if (cell == nil) {
                    cell = [[StartTimeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
                }
                return cell;
            } else {
                // 添加 datepicker
                static NSString * certif = @"DatePickerCell";
                UINib * nib = [UINib nibWithNibName:certif bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:certif];
                DatePickerCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
                if (cell == nil) {
                    cell = [[DatePickerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
                }
                return cell;
            }
        }
    }else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            // 提醒备注
            static NSString * certif = @"RemindCell";
            UINib * nib = [UINib nibWithNibName:certif bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:certif];
            RemindCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
            if (cell == nil) {
                cell = [[RemindCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
            }
            return cell;
        }else if (indexPath.row == 1) {
            static NSString * certif = @"RemarkCell";
            UINib * nib = [UINib nibWithNibName:certif bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:certif];
            RemarkCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
            if (cell == nil) {
                cell = [[RemarkCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
            }
            return cell;
        }
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSIndexPath * scheduleIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    ScheduleContentCell * scheduleCell = [tableView cellForRowAtIndexPath:scheduleIndexPath];
    NSIndexPath * remarkIndexPath = [NSIndexPath indexPathForRow:1 inSection:2];
    RemarkCell * remarkCell = [tableView cellForRowAtIndexPath:remarkIndexPath];
    if ([scheduleCell.contentTextField isFirstResponder]) {
        [scheduleCell.contentTextField resignFirstResponder];
    }else if ([remarkCell.remarkTextView isFirstResponder]) {
        [remarkCell.remarkTextView resignFirstResponder];
    }
    if (indexPath.section == 0) {
        //选中内容.
    }else if (indexPath.section == 1) {
    //选中开始时间.
        if (indexPath.row == 1) {
            //弹出时间选择器.
            _datePicker = [[UIDatePicker alloc]init];
            [tableView beginUpdates];
            if (self.isPickerCellHidden) {
                NSIndexPath * insertIndexPath = [NSIndexPath indexPathForRow:2 inSection:1];
                [tableView insertRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                self.isPickerCellHidden = NO;
            }else {
                self.isPickerCellHidden = YES;
                NSIndexPath * deleteIndexPath = [NSIndexPath indexPathForRow:2 inSection:1];
                [tableView deleteRowsAtIndexPaths:@[deleteIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            }
            [tableView endUpdates];
        }
    }else if (indexPath.section == 2) {
        //选中提醒备注.
    
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 && indexPath.row == 1) {
        return 200.0f;
    }
    if (self.isPickerCellHidden) {
        
    }else {
        if (indexPath.section == 1 && indexPath.row == 2) {
            return 250;
        }
    }
    return 44.0F;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        // 内容
        return 1;
    }else if (section == 1) {
        // 开始时间
        if (self.isPickerCellHidden) {
            return 2;
        }else {
            return 3;
        }
    }else if (section == 2) {
        //提醒 备注
        return 2;
    }
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

@end
