//
//  REFMenuViewController.m
//  REFrostedStudy
//
//  Created by M gzh on 2018/1/23.
//  Copyright © 2018年 Mr_M. All rights reserved.
//

#import "REFMenuViewController.h"
#import "REFInfoViewController.h"
#import "AppDelegate.h"

@interface REFMenuViewController ()

@end

@implementation REFMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIImageView *bgImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tempPict.jpg"]];
    bgImgView.frame = CGRectMake(0, 0, leftSideMeunWidth, 200);
    //bgImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:bgImgView];
    
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake((leftSideMeunWidth - 200)/2, CGRectGetMaxY(bgImgView.frame)+20, 200, 42)];
    nextBtn.backgroundColor = [UIColor orangeColor];
    [nextBtn setTitle:@"下一页" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(actionOfTapRightEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}
//跳转下一页
-(void)actionOfTapRightEvent{
    /**
     关闭右侧侧边栏
     */
    [self.frostedViewController hideMenuViewController];
    
    UINavigationController *navCtr= ((AppDelegate*)[UIApplication sharedApplication].delegate).rootTabbarCtrV.selectedViewController;
    REFInfoViewController *infoView=[[REFInfoViewController alloc]init];
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
