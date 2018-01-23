//
//  AppDelegate.h
//  REFrostedStudy
//
//  Created by M gzh on 2018/1/23.
//  Copyright © 2018年 Mr_M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,REFrostedViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UITabBarController *rootTabbarCtrV;


@end

