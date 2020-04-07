//
//  BaseViewController.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD+WBAddtional.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[YColorManger shareYColorManger] getFFFFFFColor];
    self.navigationController.navigationBar.translucent = NO;
    [self setNavBarLeftBarItem];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //导航标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor blackColor]}];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark ---控件---
- (void)setNavBarLeftBarItem {
    if (self.navigationController.viewControllers.count > 1) {
       
        UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftbutton.frame = CGRectMake(0, 0, 40, 30);
        
        [leftbutton setImage:[UIImage imageNamed:@"Common_back"] forState:UIControlStateNormal];
        leftbutton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        leftbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [leftbutton addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *letfBarItem = [[UIBarButtonItem alloc]initWithCustomView:leftbutton];
        self.navigationItem.leftBarButtonItem = letfBarItem;
    }
}

- (void)backBtnClicked {
   if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/// 显示hud
-(void)simpleHudShow {
    
    [MBProgressHUD wb_showActivity:self.view];;

    
}

/// 隐藏hud
-(void)simpleHudHide {
    
    [MBProgressHUD wb_hideHUDForView:self.view];
    
}

#pragma mark ---自定义导航栏左侧按钮---
- (void)setUpLeftNavBarIemWithTarget:(id)target action:(SEL)action imageName:(NSString*)imgName {
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(0, 0, 40, 30);
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftBarItem;
}

#pragma mark ---导航栏透明---
-(void)transparentNavigationBar {
  
    self.navigationController.navigationBar.translucent = YES;
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

#pragma mark ---自定义导航栏右侧按钮---

- (void)setUpRightNavBarIemWithTarget:(id)target action:(SEL)action imageName:(NSString*)imgName {
   
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(0, 0, 40, 30);
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)setUpRightNavBarIemWithTarget:(id)target action:(SEL)action title:(NSString*)title {
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(0, 0, 40, 30);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[[YColorManger shareYColorManger] getBlackColor] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}
@end
