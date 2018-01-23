//
//  CenterViewController.m
//  ViewDeckStudy
//
//  Created by Mr_M on 2017/6/19.
//  Copyright © 2017年 Mr_M. All rights reserved.
//

#import "CenterViewController.h"
#import "InfoViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"首页";
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithTitle:@"左边栏" style:UIBarButtonItemStylePlain target:self action:@selector(actionOfTapLeftEvent)];
    self.navigationItem.leftBarButtonItem=leftBarButton;
    
    UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(actionOfTapRightEvent)];
    self.navigationItem.rightBarButtonItem=rightBarButton;
    
    self.view.backgroundColor=[UIColor yellowColor];
    
}
//点击打开左侧侧边栏
-(void)actionOfTapLeftEvent{
    [self.viewDeckController openSide:IIViewDeckSideLeft animated:YES];
}
//跳转下一页
-(void)actionOfTapRightEvent{
    InfoViewController *infoView=[[InfoViewController alloc]init];
    [infoView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:infoView animated:YES];
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
