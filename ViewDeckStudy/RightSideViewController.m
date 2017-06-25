//
//  RightSideViewController.m
//  ViewDeckStudy
//
//  Created by Mr_M on 2017/6/19.
//  Copyright © 2017年 Mr_M. All rights reserved.
//

#import "RightSideViewController.h"

#import "InfoViewController.h"
#import "AppDelegate.h"

@interface RightSideViewController ()

@end

@implementation RightSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"我是右边栏";
    self.preferredContentSize = CGSizeMake(ScreenWidth/3*2, ScreenHeight);
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(actionOfTapRightEvent)];
    self.navigationItem.rightBarButtonItem=rightBarButton;
}
//跳转下一页
-(void)actionOfTapRightEvent{
    /**
    关闭右侧侧边栏
    */
    [self.viewDeckController closeSide:YES];
    
    UINavigationController *navCtr= ((AppDelegate*)[UIApplication sharedApplication].delegate).rootTabbarCtrV.selectedViewController;
    InfoViewController *infoView=[[InfoViewController alloc]init];
    [infoView setHidesBottomBarWhenPushed:YES];
    [navCtr pushViewController:infoView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
