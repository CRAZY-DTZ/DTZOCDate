//
//  AppDelegate.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "AppDelegate.h"
#import "CalenderViewController.h"
#import "DtzAdsBookViewController.h"
#import "PersonalViewController.h"
#import "ScheduleViewController.h"
#import "ScheduleNaivgationController.h"
#import "SignInVCViewController.h"

@interface AppDelegate () {
    UITabBarController * _tabBarController;
    UINavigationController * _calendarNavigator;
    UINavigationController * _contactNavigator;
    UINavigationController * _personalNavigator;
    CalenderViewController * _calendarViewController;
    PersonalViewController * _personalViewController;
    DtzAdsBookViewController * _adsBookViewController;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setSignInVC];
    return YES;
}

- (void)setupScheduleTest{
    ScheduleViewController * sdViewController = [[ScheduleViewController alloc]init];
    self.window.rootViewController = sdViewController;
}

#pragma mark - set signIn vc
- (void)setSignInVC {
    SignInVCViewController * loginViewController = [[SignInVCViewController alloc]init];
    UINavigationController * navigator = [[UINavigationController alloc]initWithRootViewController:loginViewController];
    self.window.rootViewController = navigator;
}

- (void)setupSignInMode {
    _tabBarController = [[UITabBarController alloc]init];
    _calendarViewController = [[CalenderViewController alloc]init];
    _adsBookViewController = [[DtzAdsBookViewController alloc]init];
    _personalViewController = [[PersonalViewController alloc]init];
    _calendarNavigator = [[UINavigationController alloc]initWithRootViewController:_calendarViewController];
    _contactNavigator = [[UINavigationController alloc]initWithRootViewController:_adsBookViewController];
    _personalNavigator = [[UINavigationController alloc]initWithRootViewController:_personalViewController];
    UINavigationController * personalNavigator = [[UINavigationController alloc]initWithRootViewController:_personalViewController];
    NSArray * viewControllers = [[NSArray alloc]initWithObjects:_calendarNavigator,_contactNavigator,personalNavigator, nil];
    _tabBarController.viewControllers = viewControllers;
    
    UITabBar * tabBar = _tabBarController.tabBar;
    
    UITabBarItem * calendarItem = [tabBar.items objectAtIndex:0];
    UITabBarItem * adsBookItem = [tabBar.items objectAtIndex:1];
    UITabBarItem * personalItem = [tabBar.items objectAtIndex:2];
    
    [calendarItem setImage:[UIImage imageNamed:@"listIcon"]];
    [calendarItem setSelectedImage:[UIImage imageNamed:@"listSelectedIcon"]];
    [adsBookItem setImage:[UIImage imageNamed:@"addressIcon"]];
    [adsBookItem setSelectedImage:[UIImage imageNamed:@"addressSelectedIcon"]];
    [personalItem setImage:[UIImage imageNamed:@"listIcon"]];
    [personalItem setSelectedImage:[UIImage imageNamed:@"listSelectedIcon"]];

    tabBar.tintColor = [UIColor whiteColor];

    [tabBar setBackgroundImage:[[UIImage alloc]init]];
    [tabBar setShadowImage:[UIImage new]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],UITextAttributeTextColor, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]forState:UIControlStateSelected];
    
    self.window.rootViewController = _tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
