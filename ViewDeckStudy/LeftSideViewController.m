//
//  LeftSideViewController.m
//  ViewDeckStudy
//
//  Created by Mr_M on 2017/6/19.
//  Copyright © 2017年 Mr_M. All rights reserved.
//

#import "LeftSideViewController.h"

#import "InfoViewController.h"
#import "AppDelegate.h"


@interface LeftSideViewController ()

@end

@implementation LeftSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.preferredContentSize = CGSizeMake(ScreenWidth/3*2, ScreenHeight-600);
    self.view.backgroundColor=[UIColor whiteColor];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (IBAction)goNextView:(UIButton *)sender {
    /**
     关闭侧边栏
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
