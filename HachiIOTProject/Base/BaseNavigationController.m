//
//  BaseNavigationController.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "BaseNavigationController.h"
#import "BaseViewController.h"
@interface BaseNavigationController ()<UIGestureRecognizerDelegate>


@property (nonatomic, strong) UIView *bottomLine;


@property (nonatomic, strong) UIImageView *bottomImg;

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    [self addNavigationBarShadow];
}


#pragma mark - 添加导航底部阴影和横线
-(void)addNavigationBarShadow{
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 43, kScreenWidth, 0.5)];
    _bottomLine.backgroundColor = [[YColorManger shareYColorManger] getecececColor];
    [self.navigationBar addSubview:_bottomLine];
    
    _bottomImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43.5, kScreenWidth, 5)];
    _bottomImg.image = [UIImage imageNamed:@"Common_shadowImg"];
    [self.navigationBar addSubview:_bottomImg];

}

// 隐藏导航底部横线
-(void)isShowShadowLine:(BOOL)isShould {
    _bottomLine.hidden = !isShould;
}

// 隐藏导航背景
-(void)isShowShadowImg:(BOOL)isShould {
    _bottomImg.hidden = !isShould;
}

#pragma mark - 为子控制器添加自定义返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }else
    {
        
    }
    [super pushViewController:viewController animated:animated];
}


/**
 * 每当用户触发[返回手势]时都会调用一次这个方法
 * 返回值:返回YES,手势有效; 返回NO,手势失效
 *
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    return self.childViewControllers.count > 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
