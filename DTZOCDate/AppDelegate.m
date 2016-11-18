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
    _calendarViewController = [[CalenderViewController alloc]init];
    _calendarNavigator = [[UINavigationController alloc]initWithRootViewController:_calendarViewController];
    self.window.rootViewController = _calendarNavigator;
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
