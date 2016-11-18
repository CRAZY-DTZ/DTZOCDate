//
//  PersonalViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/7.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "PersonalViewController.h"
#import "AvatarCell.h"
#import "PersonalNormalCell.h"
#import "AvatarViewController.h"

@interface PersonalViewController () {
    IBOutlet UITableView *_personalTableView;
    NSMutableArray * _sectionOneArray;
    NSMutableArray * _sectionTwoArray;
}

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"个人";
    [self setArray];
    [self setTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - navigationAppearence 
- (void)navigationAppearence {
    
    
}

#pragma mark - tableview delegate
- (void)setTableView {
    _personalTableView.delegate = self;
    _personalTableView.dataSource = self;
}

- (void)setArray {
    NSString * str1 = @"头像";
    NSString * str2 = @"名字";
    NSString * str3 = @"性别";
    NSString * str5 = @"个性签名";
    NSString * str4 = @"地区";
    _sectionOneArray = [[NSMutableArray alloc]initWithObjects:str1,str2, nil];
    _sectionTwoArray = [[NSMutableArray alloc]initWithObjects:str3,str4,str5, nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //注册 normalCell
    static NSString * certif = @"PersonalNormalCell";
    UINib * nib = [UINib nibWithNibName:certif bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:certif];
    if(indexPath.section == 0) {
        if (indexPath.row == 0) {
            //头像 Cell
            static NSString * certif = @"AvatarCell";
            UINib * nib = [UINib nibWithNibName:certif bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:certif];
            AvatarCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
            if (cell == nil) {
                cell = [[AvatarCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
            }
            return cell;
        }else if (indexPath.row == 1) {
            PersonalNormalCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
            if (cell == nil) {
                cell = [[PersonalNormalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
            }
            cell.contentLabel.text = @"隔壁小吴";
            return cell;
        }
    }else if (indexPath.section == 1) {
        PersonalNormalCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
        if (cell == nil) {
            cell = [[PersonalNormalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
        }
        if (indexPath.row == 0) {
            //性别Cell
            cell.titleLabel.text = [_sectionTwoArray objectAtIndex:indexPath.row];
            cell.contentLabel.text = @"男";
        }else if (indexPath.row == 1) {
            //地区cell
            cell.titleLabel.text = [_sectionTwoArray objectAtIndex:indexPath.row];
            cell.contentLabel.text = @"广东 广州";
        }else if (indexPath.row == 2) {
            //个性签名cell
            cell.titleLabel.text = [_sectionTwoArray objectAtIndex:indexPath.row];
            cell.contentLabel.text = @"DTZ . 苦过 方知甜 .";
        }
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 90;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        //跳转到头像的viewcontroller
        AvatarViewController * avatarViewController = [[AvatarViewController alloc]init];
        avatarViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:avatarViewController animated:YES];
    }
}

@end
