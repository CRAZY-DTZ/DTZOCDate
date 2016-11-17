//
//  DateDetailViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/22.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "DateDetailViewController.h"

@interface DateDetailViewController ()

@end

@implementation DateDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailTextView.showsVerticalScrollIndicator = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"事件详情";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
