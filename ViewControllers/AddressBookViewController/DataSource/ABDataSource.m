//
//  ABDataSource.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "ABDataSource.h"
#import "AdsBookCell.h"
#import "ContactModel.h"

@implementation ABDataSource


- (id)init {
    self = [super init];
    self.contactsArray = [[NSMutableArray alloc]init];
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //自定义的通讯录的cell
    static NSString * certif = @"AdsBookCell";
    UINib * nib = [UINib nibWithNibName:certif bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:certif];
    AdsBookCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
    if (cell == nil) {
        cell = [[AdsBookCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
    }
    if ([self.contactsArray objectAtIndex:indexPath.row]) {
        ContactModel * contactModel = [self.contactsArray objectAtIndex:indexPath.row];
        cell.nicknameLabel.text = [contactModel.familyName stringByAppendingString:contactModel.givenName];
        if (contactModel.imageData != nil) {
            cell.avatarImageView.image = [UIImage imageWithData:contactModel.imageData];
        }else {
            cell.avatarImageView.image = [UIImage imageNamed:@"Contact_default"];
        }
        if (contactModel.mobilePhonesArray.count != 0) {
            cell.phoneNumLabel.text = [contactModel.mobilePhonesArray objectAtIndex:0];
        }
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //返回值为通讯录的model 的count
    return self.contactsArray.count;
}

@end
