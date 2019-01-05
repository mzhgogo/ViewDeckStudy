//
//  AppDelegate.m
//  ViewDeckStudy
//
//  Created by Mr_M on 2017/6/19.
//  Copyright © 2017年 Mr_M. All rights reserved.
//

#import "AppDelegate.h"

#import "CenterViewController.h"
#import "CenterSecondView.h"
#import "LeftSideViewController.h"
#import "RightSideViewController.h"
@interface AppDelegate ()<IIViewDeckControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];
    
    //中间
    CenterViewController *centView =[[CenterViewController alloc]init];
    UINavigationController *centNvi=[[UINavigationController alloc]initWithRootViewController:centView];
    centNvi.tabBarItem.title=@"首页";
    
    CenterSecondView *centSecView =[[CenterSecondView alloc]init];
    UINavigationController *centSecNvi=[[UINavigationController alloc]initWithRootViewController:centSecView];
    centSecNvi.tabBarItem.title=@"消息";
    
    UITabBarController *tarBarCtr=[[UITabBarController alloc]init];
    [tarBarCtr setViewControllers:[NSArray arrayWithObjects:centNvi,centSecNvi, nil]];
    _rootTabbarCtrV=tarBarCtr;
    //左边view 采用xib多种形式研究
    LeftSideViewController *leftVC =[[LeftSideViewController alloc]initWithNibName:@"LeftSideViewController" bundle:[NSBundle mainBundle]];
    //右边
    RightSideViewController *rightView=[[RightSideViewController alloc]init];
    UINavigationController *rightNvi=[[UINavigationController alloc]initWithRootViewController:rightView];
    
    IIViewDeckController *viewDeckController =[[IIViewDeckController alloc]initWithCenterViewController:_rootTabbarCtrV leftViewController:leftVC rightViewController:rightNvi];
    //仅左侧边栏
//      IIViewDeckController *viewDeckController =[[IIViewDeckController alloc]initWithCenterViewController:_rootTabbarCtrV leftViewController:leftVC];
    viewDeckController.delegate=self;
    self.window.rootViewController=viewDeckController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
/**
 Tells the delegate that the specified side will open.
 
 If this delegate method is not implemented, view deck will always open the side.
 
 @param viewDeckController The view deck controller informing the delegate.
 @param side               The side that will open. Either `IIViewDeckSideLeft` or `IIViewDeckSideRight`.
 
 @return `YES` if the View Deck Controller should open the side in question, `NO` otherwise.
 */
- (BOOL)viewDeckController:(IIViewDeckController *)viewDeckController willOpenSide:(IIViewDeckSide)side{
    NSLog(@"willOpenSide %@  %@",@(side),viewDeckController.leftViewController);
    return YES;
}

/**
 Tells the delegate that the specified side did open.
 
 @param viewDeckController The view deck controller informing the delegate.
 @param side               The side that did open. Either `IIViewDeckSideLeft` or `IIViewDeckSideRight`.
 */
- (void)viewDeckController:(IIViewDeckController *)viewDeckController didOpenSide:(IIViewDeckSide)side{
    NSLog(@"被打开的who %@",@(side));
}

/**
 Tells the delegate that the specified side will close.
 
 If this delegate method is not implemented, view deck will always close the side.
 
 @param viewDeckController The view deck controller informing the delegate.
 @param side               The side that will close. Either `IIViewDeckSideLeft` or `IIViewDeckSideRight`.
 
 @return `YES` if the View Deck Controller should close the side in question, `NO` otherwise.
 */
- (BOOL)viewDeckController:(IIViewDeckController *)viewDeckController willCloseSide:(IIViewDeckSide)side{
    
    return YES;
}

/**
 Tells the delegate that the specified side did close.
 
 If this delegate method is not implemented, view deck will always start panning.
 
 @param viewDeckController The view deck controller informing the delegate.
 @param side               The side that did close. Either `IIViewDeckSideLeft` or `IIViewDeckSideRight`.
 */
- (void)viewDeckController:(IIViewDeckController *)viewDeckController didCloseSide:(IIViewDeckSide)side{
    NSLog(@"被关闭的who %@",@(side));
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
