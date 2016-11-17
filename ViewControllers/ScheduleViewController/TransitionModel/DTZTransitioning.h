//
//  DTZTransitioning.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/12.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SdCell.h"
#import "NoteViewController.h"
#import "ScheduleViewController.h"
#import "SecondViewController.h"
#import "CalenderViewController.h"
#import "NoteListViewController.h"

@interface DTZTransitioning : NSObject<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate>

@property BOOL isPresent;
@property (strong, nonatomic) NSArray * visibleCells;
@property CGRect originalFrame;
@property CGRect finalFrame;
@property (strong, nonatomic) SdCell * selectedCell;
@property (strong) UIPercentDrivenInteractiveTransition * interactionController;
@property (weak) NoteListViewController * presentVC;
@property (weak) ScheduleViewController * scheduleViewController;

//传参数 到此类的对象中 .
- (void)getParamsFromTableViewWithSelectedCell:(SdCell *)selectedCell VisibleCells:(NSArray*)visibleCells OriginalFrame:(CGRect)originalFrame FinalFrame:(CGRect)finalFrame PresentVC:(NoteListViewController *)presentVC FormalVC:(ScheduleViewController *)formalVC;

@end
