//
//  LoginVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "LoginVC.h"
#import "LoginView.h"
#import "RegisterVC.h"
#import "AppDelegate.h"
#import "ForgetVC.h"
@interface LoginVC ()

@property (nonatomic, strong) LoginView * loginView;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLoginView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)initLoginView {
   
    _loginView = [[LoginView alloc] init];
    _loginView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_loginView];

    WS(weakSelf);
    _loginView.clickedLoginViewBtns = ^(NSInteger index) {

        if (index == 0) {

            [weakSelf requestSmarthomeLogin];
        }
        else if (index == 1) { //忘记密码

            [weakSelf pushForgotPasswordVC];
        }
        else if (index == 2) { //注册

            [weakSelf pushRegisteredVC];
        }
    };
    
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark -  ---点击事件---
//登陆
- (void)requestSmarthomeLogin {
    
    NSDictionary * parmeters = @{@"phone":_loginView.phoneTextStr,@"pwd":_loginView.passwordTextStr};
    [self simpleHudShow];
    WS(weakself);
    [YNetworkRequest postWithURLString:SmartIOTLogin parameters:parmeters success:^(NSDictionary * _Nonnull dic) {
        [weakself simpleHudHide];
        if ([dic[@"code"] integerValue] == 1000){
            NSDictionary * userDic = dic[@"data"];
            //存储本地数据
            [[SmartStorageModel shareSmartStorageModel] storageUserInfo:userDic];
            //从本地获取数据
            [[SmartStorageModel shareSmartStorageModel] takeoutUserInfoFromStorage];
            
            double delayInSeconds = 1.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^{
                
                AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
                [appDelegate addMainTabBarController:YES];
            });
            [Help showSuccessMessage:@"登陆成功"];
        }else{
            [Help showErrorMessage:[dic objectForKey:@"message"]];
        }
    } error:^(NSError * _Nonnull err) {
        [weakself simpleHudHide];
        [Help showErrorMessage:Htjf_Connect_Failure];
    }];
    
}

//忘记密码
- (void)pushForgotPasswordVC {
    ForgetVC * registervc = [[ForgetVC alloc] init];
    [self.navigationController pushViewController:registervc animated:YES];
}

//注册
- (void)pushRegisteredVC {
    
    RegisterVC * registervc = [[RegisterVC alloc] init];
    [self.navigationController pushViewController:registervc animated:YES];
}
@end
