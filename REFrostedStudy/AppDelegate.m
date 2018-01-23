//
//  AppDelegate.m
//  REFrostedStudy
//
//  Created by M gzh on 2018/1/23.
//  Copyright © 2018年 Mr_M. All rights reserved.
//

#import "AppDelegate.h"
#import "REFCenterViewController.h"
#import "REFCenterSecondView.h"
#import "REFMenuViewController.h"
//通用获取屏幕宽高
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface AppDelegate ()<REFrostedViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    //中间
    REFCenterViewController *centView =[[REFCenterViewController alloc]init];
    UINavigationController *centNvi=[[UINavigationController alloc]initWithRootViewController:centView];
    centNvi.tabBarItem.title=@"首页";
    
    REFCenterSecondView *centSecView =[[REFCenterSecondView alloc]init];
    UINavigationController *centSecNvi=[[UINavigationController alloc]initWithRootViewController:centSecView];
    centSecNvi.tabBarItem.title=@"消息";
    
    UITabBarController *tarBarCtr=[[UITabBarController alloc]init];
    [tarBarCtr setViewControllers:[NSArray arrayWithObjects:centNvi,centSecNvi, nil]];
    self.rootTabbarCtrV = tarBarCtr;
    
    //侧边栏
    REFMenuViewController *menuView = [[REFMenuViewController alloc]init];
   REFrostedViewController *rostedViewController = [[REFrostedViewController alloc] initWithContentViewController:tarBarCtr menuViewController:menuView];
    rostedViewController.direction = REFrostedViewControllerDirectionLeft;
    rostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleDark;
    rostedViewController.liveBlur = YES;
    rostedViewController.limitMenuViewSize = YES;
    rostedViewController.backgroundFadeAmount=0.5;
    rostedViewController.delegate = self;
    rostedViewController.menuViewSize=CGSizeMake(leftSideMeunWidth, ScreenHeight);
    
    self.window.rootViewController=rostedViewController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
