//
//  NoteListViewController.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/30.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "NoteListViewController.h"
#import "TestCell.h"

@interface NoteListViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation NoteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTableView];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 12.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setLabels {
    
}

#pragma mark tableview delegate && datasource
- (void)setupTableView {
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(13, 30, winSize.size.width - 26, 60)];
    topView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:topView];
    
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, winSize.size.width - 26, 60)
                                     byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                           cornerRadii:CGSizeMake(10.0f, 10.0f)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    topView.layer.mask = maskLayer;
    
    self.noteTableView = [[UITableView alloc]initWithFrame:CGRectMake(13, 90, winSize.size.width - 26, winSize.size.height - 110) style:UITableViewStylePlain
                          ];
    self.noteTableView.delegate = self;
    self.noteTableView.dataSource = self;
    self.noteTableView.layer.masksToBounds = YES;
    
    UIBezierPath *maskPath2;
    maskPath2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, winSize.size.width - 26, winSize.size.height - 110)
                                     byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(10.0f, 10.0f)];
    CAShapeLayer *maskLayer2 = [[CAShapeLayer alloc] init];
    maskLayer2.path = maskPath2.CGPath;
    self.noteTableView.layer.mask = maskLayer2;
    
    [self.view addSubview:self.noteTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * certif = @"TestCell";
    UINib * nib = [UINib nibWithNibName:certif bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:certif];
    TestCell * cell = [tableView dequeueReusableCellWithIdentifier:certif];
    if (cell == nil) {
        cell = [[TestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:certif];
    }
    cell.selected = false;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //选中了 note . 展示 note
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
