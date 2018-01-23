//
//  REFCenterViewController.m
//  REFrostedStudy
//
//  Created by M gzh on 2018/1/23.
//  Copyright © 2018年 Mr_M. All rights reserved.
//

#import "REFCenterViewController.h"
#import "REFrostedViewController.h"
#import "REFInfoViewController.h"
#import "LeftSideScrollView.h"
#import "HelpRightViewController.h"
#import "HelpLeftViewController.h"


@interface REFCenterViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) LeftSideScrollView *testScrollView;
@property (nonatomic, strong) NSMutableArray *childControllers;
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation REFCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"首页";
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithTitle:@"左边栏" style:UIBarButtonItemStylePlain target:self action:@selector(actionOfTapLeftEvent:)];
    self.navigationItem.leftBarButtonItem=leftBarButton;
    UIBarButtonItem *rightBarButton=[[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(actionOfTapRightEvent)];
    self.navigationItem.rightBarButtonItem=rightBarButton;
    [self creatVC];
}
//点击显示侧边栏
-(void)actionOfTapLeftEvent:(UIButton *)sender{
    [self.frostedViewController presentMenuViewController];
}
//滑动显示侧边栏
- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender{
    [self.frostedViewController panGestureRecognized:sender];
}
//跳转下一页
-(void)actionOfTapRightEvent{
    REFInfoViewController *infoView=[[REFInfoViewController alloc]init];
    [infoView setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:infoView animated:YES];
}
#pragma mark 创建视图控制器
-(void)creatVC{
    NSArray *vcNameArray=[[NSArray alloc]initWithObjects:@"HelpLeftViewController",@"HelpRightViewController", nil];
    //循环创建数组
    for (int i=0; i<vcNameArray.count; i++) {
        Class class=NSClassFromString(vcNameArray[i]);
        UIViewController *vc =[[class alloc] init];
        CGFloat X=self.view.frame.size.width*i;
        CGFloat W=self.view.frame.size.width;
        CGFloat H=self.view.frame.size.height;
        [self addChildViewController:vc];
        vc.view.frame=CGRectMake(X, 0, W, H);
        [self.testScrollView addSubview:vc.view];
        [self.childControllers addObject:vc];
    }
    [self setChildViewControllerWithCurrentIndex:0];
}
#pragma mark - 切换视图
- (void)setChildViewControllerWithCurrentIndex:(NSInteger)currentIndex
{
    for (int i = 0; i < self.childControllers.count; i++) {
        id obj = self.childControllers[i];
        if ([obj isKindOfClass:[UIViewController class]]) {
            UIViewController *controller = (UIViewController*)obj;
            if (i == currentIndex) {
                [controller viewWillAppear:YES];
                [controller willMoveToParentViewController:self];
                [self addChildViewController:controller];
                [controller didMoveToParentViewController:self];
            } else {
                [controller viewWillDisappear:YES];
                [controller willMoveToParentViewController:self];
                [controller removeFromParentViewController];
                [controller didMoveToParentViewController:self];
            }
        }
    }
}
#pragma mark UIScrollViewDelegate
//滑动将要停止
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index =scrollView.contentOffset.x/self.view.frame.size.width;
    if (index == self.currentIndex) { return; }
    self.currentIndex = index;
    //视图即将要显示
    [self.childControllers[self.currentIndex] viewWillAppear:YES];
    [self setChildViewControllerWithCurrentIndex:index];
}

#pragma mark lazy
- (UIScrollView *)testScrollView{
    if (!_testScrollView) {
        _testScrollView= [[LeftSideScrollView alloc]initWithFrame:self.view.bounds];
        _testScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*2, 0);
        _testScrollView.pagingEnabled=YES;
        _testScrollView.bounces=NO;
        _testScrollView.showsVerticalScrollIndicator=NO;
        _testScrollView.showsHorizontalScrollIndicator=NO;
       _testScrollView.directionalLockEnabled=YES;
        _testScrollView.scrollsToTop = NO;
        _testScrollView.delegate=self;
        [self.view addSubview:_testScrollView];
    }
    return _testScrollView;
}

- (NSMutableArray *)childControllers{
    if (!_childControllers) {
        _childControllers = [[NSMutableArray alloc] init];
    }
    return _childControllers;
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
