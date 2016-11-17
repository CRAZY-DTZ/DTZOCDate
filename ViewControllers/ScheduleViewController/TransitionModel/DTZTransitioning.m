//
//  DTZTransitioning.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/12.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "DTZTransitioning.h"
#import "NoteViewController.h"
#import "NoteListViewController.h"

@implementation DTZTransitioning {
    UIScreenEdgePanGestureRecognizer * _edgePanGesture;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.45;
}

- (void)animationEnded:(BOOL)transitionCompleted {
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    SecondViewController * nextVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView * addView = nextVC.view;
    addView.hidden = self.isPresent ? YES:NO;
    self.selectedCell.frame = self.isPresent ? self.originalFrame:self.finalFrame;
    [[transitionContext containerView] addSubview:addView];
    //设置动作并且设置Cell的约束 放大缩小只是对Cell的frame 进行变换
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //先对visible 中的不是selected 的cell 进行移动的切换。 如果已经present 就转换成收缩。
        for (SdCell * cell in self.visibleCells) {
            if (cell != self.selectedCell) {
                CGRect frame = cell.frame;
                if (cell.tag < self.selectedCell.tag) {
                    //初始化移动的距离
                    NSInteger yDistance = self.originalFrame.origin.y - self.finalFrame.origin.y + 30;
                    NSInteger yUpdate = self.isPresent ? yDistance : -yDistance;
                    frame.origin.y -= yUpdate;
                }else if (cell.tag > self.selectedCell.tag) {
                    NSInteger yDistance = CGRectGetMaxY(self.finalFrame) - CGRectGetMaxY(self.originalFrame) + 30;
                    NSInteger yUpdate = self.isPresent ? yDistance : -yDistance;
                    frame.origin.y += yUpdate;
                }
                cell.frame = frame;
                cell.transform = self.isPresent ? CGAffineTransformMakeScale(0.8, 1.0):CGAffineTransformIdentity;
            }
        }
        self.selectedCell.frame = self.isPresent? self.finalFrame : self.originalFrame;
        [self.selectedCell layoutIfNeeded];
        //隐藏navigationBar 和tabbar
    } completion:^(BOOL finished) {
        addView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.isPresent = YES;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.isPresent = NO;
    return self;
}

- (void)getParamsFromTableViewWithSelectedCell:(SdCell *)selectedCell VisibleCells:(NSArray*)visibleCells OriginalFrame:(CGRect)originalFrame FinalFrame:(CGRect)finalFrame PresentVC:(NoteListViewController *)presentVC FormalVC:(ScheduleViewController *)formalVC{
    //设置参数,在设置delegate,之前先将参数设置好.
    self.visibleCells = visibleCells;
    self.selectedCell = selectedCell;
    self.originalFrame = originalFrame;
    self.finalFrame = finalFrame;
    self.interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
    self.presentVC = presentVC;
    self.scheduleViewController = formalVC;
    //添加pan手势,模仿push的左滑手势收回 . pan手势中按照百分比来收缩/展开具体的transitioning
    _edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    _edgePanGesture.edges = UIRectEdgeLeft;
    [self.presentVC.view addGestureRecognizer:_edgePanGesture];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.interactionController;
}

- (void)handlePanGesture:(UIScreenEdgePanGestureRecognizer *)edgePanGesture {
    //判断panGesture是在开始启动/移动/结束.State
    UIView * view = self.presentVC.view;
    if (edgePanGesture.state == UIGestureRecognizerStateBegan) {
        //开始状态下
        [self.presentVC dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else if(edgePanGesture.state == UIGestureRecognizerStateChanged) {
        //在手势移动的状态下
        CGPoint translation = [edgePanGesture translationInView:view];
        CGFloat precentFloat = fabs(translation.x / CGRectGetWidth(view.bounds)); //通过绝对值来算滑动的百分比
        NSLog(@"百分比为%f",precentFloat);
        //重新update 完成度.
        [self.interactionController updateInteractiveTransition:precentFloat];
    }else if (edgePanGesture.state == UIGestureRecognizerStateEnded) {
        //在手势结束的时候计算
        if ([edgePanGesture velocityInView:view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        }else {
//            self.presentVC.view.hidden = NO;
            [self.interactionController cancelInteractiveTransition];
            //重置 interactionController 重置完成的Transition
            [self.scheduleViewController presentViewController:self.presentVC animated:NO completion:^{
            }];
        }
        self.interactionController = [[UIPercentDrivenInteractiveTransition alloc]init];
    }
}

- (void)finishInteractive {
    
}

- (void)goBackClick {
    [self.presentVC dismissViewControllerAnimated:YES completion:^{
        
    }];
    [self.interactionController finishInteractiveTransition];
}


@end
