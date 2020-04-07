//
//  AppDelegate.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginVC.h"
#import "BaseNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    #if DEBUG
        [[TuyaSmartSDK sharedInstance] setDebugMode:YES];
    #endif
    
    [[TuyaSmartSDK sharedInstance] startWithAppKey:SDK_APPKEY secretKey:SDK_APPSECRET];
    
    if ([[SmartStorageModel shareSmartStorageModel] takeoutUserInfoFromStorage]) {
        [self requestFreshToken];
        
        [self addMainTabBarController:NO];
        
    }else{
       [self addLoginVC];
    }
    
    return YES;
}

#pragma mark - 添加控件

- (void)addLoginVC {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    LoginVC * loginVC = [LoginVC new];
    BaseNavigationController * loginNC = [[BaseNavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = loginNC;
    [self.window makeKeyAndVisible];
}

- (void)addMainTabBarController:(BOOL)animation {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.tabbarVC = [[MainTabbarVC alloc] init];
    self.tabbarVC.selectedIndex = 0;
    self.window.rootViewController = self.tabbarVC;
    [self.window makeKeyAndVisible];

    if (animation) {
        CATransition *anima = [CATransition animation];
        anima.type = @"push";//设置动画的类型
        anima.subtype = kCATransitionFromRight; //设置动画的方向
        anima.duration = 0.25f;
        [self.window.layer addAnimation:anima forKey:@"revealAnimation"];
    }
    
    [[UITabBar appearance] setTranslucent:NO];
    if (@available(iOS 11.0, *))
    {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    [self loginTuyaSdk];
}

//涂鸦sdk登陆
- (void)loginTuyaSdk {
    [[TuyaSmartUser sharedInstance] loginByUid:[UserModel shareUserModel].user.tuyaAccount password:@"12345678" countryCode:@"86" success:^{
        NSLog(@">>>>>>成功");
        [[IOTRequestManger shareIOTRequestManger] requestFamilyListData];
    
    } failure:^(NSError *error) {
        NSLog(@"失败");
    }];
}

//刷新token
- (void)requestFreshToken {

    NSDictionary * dic = @{@"refreshToken":[UserModel shareUserModel].refreshToken};
    [YNetworkRequest postWithURLString:SmartIOTAuthToken parameters:dic success:^(NSDictionary * _Nonnull dic) {
        if ([dic[@"code"] integerValue] == 1000){
            NSDictionary * userDic = dic[@"data"];
            if ([userDic objectForKey:@"refreshToken"]) {
                [UserModel shareUserModel].refreshToken = userDic[@"refreshToken"];
            }
            if ([userDic objectForKey:@"token"]) {
               [UserModel shareUserModel].token = userDic[@"token"];
            }
        }
    } error:^(NSError * _Nonnull err) {
        NSLog(@"%@",err);
    }];
}
@end
