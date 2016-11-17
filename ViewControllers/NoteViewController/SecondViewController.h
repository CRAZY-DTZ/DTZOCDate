//
//  SecondViewController.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/16.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *topView;

@property (strong, nonatomic) IBOutlet UITableView *noteTableView;

@property (strong, nonatomic) IBOutlet UIView *contentView;

@end
