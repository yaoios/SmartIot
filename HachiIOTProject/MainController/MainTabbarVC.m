//
//  MainTabbarVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "MainTabbarVC.h"
#import "YHomeVC.h"
#import "YRoomVC.h"
#import "YMyVC.h"
#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import <UIView+YYAdd.h>
@interface MainTabbarVC ()<CAAnimationDelegate>

/// 水纹动画点击效果
@property (nonatomic, strong) CAShapeLayer *ripplrLayer;

/// 记录上一个被选中按钮
@property (nonatomic, strong) UIControl *selectedBtn;

@end

@implementation MainTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllchildViewControllers];
    
    [self setTabBarBackgroundColor];
    
    [self addTabBarShadow];
    
    self.tabBar.backgroundColor = [[YColorManger shareYColorManger] getf8f8f8Color];
    
    [self layoutSubviews];
}

//添加自控制器
-(void)setupAllchildViewControllers {
    self.tabBar.translucent = NO;
    
    YHomeVC * homevc = [[YHomeVC alloc] init];
    BaseNavigationController * homeNav = [self addChildVC:homevc title:@"主页" imgName:@"Tabbar_HomeNotSelected_Icon" selImgName:@"Tabbar_HomeSelected_Icon"];
    
    YRoomVC * roomvc = [[YRoomVC alloc] init];
    BaseNavigationController *roomNav = [self addChildVC:roomvc title:@"消息" imgName:@"Tabbar_RoomNotSelected_Icon" selImgName:@"Tabbar_RoomSelected_Icon"];
    
    YMyVC * myvc = [[YMyVC alloc] init];
    BaseNavigationController *myNav =[self addChildVC:myvc title:@"我的" imgName:@"Tabbar_MyPageNotSelected_Icon" selImgName:@"Tabbar_MyPageSelected_Icon"];
    
    self.viewControllers = [NSMutableArray arrayWithArray:@[homeNav,roomNav,myNav]];
    
    if (@available(iOS 10.0, *)) {
       self.tabBar.unselectedItemTintColor = [[YColorManger shareYColorManger] get909090Color];
       } else {
       
       }
}

#pragma mark - 设置Tabbar的背景色和上方分隔线
- (void)setTabBarBackgroundColor {
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    if (IS_PhoneXAll) {
        CGRect frame = bgView.frame;
        frame.size.height += 34;
        bgView.frame = frame;
    }
    [self.tabBar insertSubview:bgView atIndex:0];
    
    //    //判断iphonex
    if (IS_PhoneXAll)
    {
        for (UIView * views in self.tabBar.subviews) {
            
            if ([views isKindOfClass:[UIView class]]) {
                CGRect frame = views.frame;
                if (frame.size.height < 83) {
                    frame.size.height += 34;
                    views.frame = frame;
                }
            }
        }
    }
}

#pragma mark - 添加导航控制器
- (BaseNavigationController *)addChildVC:(UIViewController *)childVC title:(NSString *)title imgName:(NSString *)imgName selImgName:(NSString *)selImgName
{
    childVC.tabBarItem.title = title;
    
    childVC.tabBarItem.image = [UIImage imageNamed:imgName];
    UIImage *ImageSel = [UIImage imageNamed:selImgName];
    ImageSel = [ImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = ImageSel;
    [childVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                     [[YColorManger shareYColorManger] getdf2d1fColor], NSForegroundColorAttributeName,
                                     nil] forState:UIControlStateSelected];
    
     BaseNavigationController *navVC = [[BaseNavigationController alloc] initWithRootViewController:childVC];
//    [self addChildViewController:navVC];
    return navVC;
}

#pragma mark - 添加阴影
//添加阴影
-(void)addTabBarShadow{
    self.tabBar.backgroundColor = [[YColorManger shareYColorManger] getFFFFFFColor];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [self dropShadowWithOffset:CGSizeMake(0, 2)
                        radius:3
                         color:[[YColorManger shareYColorManger] getBlackColor]
                       opacity:0.3];
}

//设置阴影
- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.tabBar.bounds);
    self.tabBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.tabBar.layer.shadowColor = color.CGColor;
    self.tabBar.layer.shadowOffset = offset;
    self.tabBar.layer.shadowRadius = radius;
    self.tabBar.layer.shadowOpacity = opacity;
    
    self.tabBar.clipsToBounds = NO;
}

//找出tabbar的按钮
- (void)layoutSubviews{
    int i = 0;
    for (UIControl *tabBarButton in self.tabBar.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
            
            if (i == 0) {
                [self tabBarButtonClick:tabBarButton];
            }
            i++;
            
        }
    }
}

//tabBarButton点击事件
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    
    for (UIView *imageView in _selectedBtn.subviews){
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]||[imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据需求自定义
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.15,@1.12,@1.10,@1.07,@1.05,@1.03,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            //把动画添加上去就OK了
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
    
    _selectedBtn = tabBarButton;
    
    for (UIView *imageView in tabBarButton.subviews) {
        //
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]||[imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            [self addRipplrLayerWithView:tabBarButton];
            //需要实现的帧动画,这里根据需求自定义
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.03,@1.05,@1.07,@1.10,@1.12,@1.15];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            //把动画添加上去就OK了
            [imageView.layer addAnimation:animation forKey:nil];
            
        }
    }
}

//添加水墨
-(void)addRipplrLayerWithView:(UIView *)view{
    NSLog(@"%@",view);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(view.width/2.f, view.height/2.f, 0, 0)];
    
    _ripplrLayer = [CAShapeLayer layer];
    _ripplrLayer.frame = view.bounds;
    _ripplrLayer.position = CGPointMake(view.frame.size.width/2.f, view.frame.size.height/2.f);
    _ripplrLayer.strokeColor = [UIColor clearColor].CGColor;
    _ripplrLayer.fillColor = [[YColorManger shareYColorManger] getecececColor].CGColor;
    _ripplrLayer.path = path.CGPath;
    _ripplrLayer.strokeStart = 0.f;
    _ripplrLayer.strokeEnd = 1.f;
    _ripplrLayer.masksToBounds = YES;
    [view.layer addSublayer:_ripplrLayer];
    
    [_ripplrLayer addAnimation:[self loadRipplrAnimationWithLocation:CGPointMake(view.width/2.f, view.height/2.f) duration:.5f withView:view] forKey:nil];
}

//设置水墨动画
-(CAAnimationGroup *)loadRipplrAnimationWithLocation:(CGPoint)location duration:(CGFloat)duration withView:(UIView *)view{
    
    UIBezierPath *fromPaht = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(location.x, location.y, 0, 0)];
    
    CGFloat radius = 0.f ;
    
    radius = view.width/2.f;
    
    
    CGRect newRect = CGRectInset(CGRectMake(view.width/2.f, view.height/2.f, 0, 0), -radius, -radius);
    
    UIBezierPath *toPath = [UIBezierPath bezierPathWithOvalInRect:newRect];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;
    animation.keyPath = @"path";
    animation.fromValue = (__bridge id _Nullable)(fromPaht.CGPath);
    animation.toValue = (__bridge id _Nullable)(toPath.CGPath);
    animation.duration = duration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *alphAni = [CABasicAnimation animation];
    alphAni.keyPath = @"opacity";
    alphAni.fromValue = [NSNumber numberWithFloat:1.f];
    alphAni.toValue   = [NSNumber numberWithFloat:0.f];
    alphAni.duration = duration;
    alphAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,alphAni];
    group.duration = duration;
    group.repeatCount = 1;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    return group;
}


- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
}

@end
