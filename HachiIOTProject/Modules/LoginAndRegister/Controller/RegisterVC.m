//
//  RegisterVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "RegisterVC.h"
#import "RegisterView.h"
#import "AppDelegate.h"
@interface RegisterVC ()

@property (nonatomic, strong) RegisterView * registerView;

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    [self initRegisteredView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark - -- 控件 --
- (void)initRegisteredView
{
    _registerView = [[RegisterView alloc] init];
    _registerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_registerView];
    
    WS(weakSelf);
    _registerView.clickedRegisteredViewBtn = ^(NSInteger index) {
      
        if (index == 0) {
            
            [weakSelf requestSmarthomeSendVerifyCode];
        }
        else {
            
            [weakSelf requestSmarthomeRegisterUser];
        }
    };
    
    [_registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - -- 代理 --

#pragma mark - -- 点击事件 --

#pragma mark - -- 数据处理 --
- (void)requestSmarthomeSendVerifyCode {
    [self simpleHudShow];
    NSDictionary * parameter = @{@"phone":_registerView.phoneTextStr,
                              @"type":@"1"
       };
    WS(weakSelf);
    [YNetworkRequest postWithURLString:SmartIOTVerifyCode parameters:parameter success:^(NSDictionary * _Nonnull dic) {
        [weakSelf simpleHudHide];
        if ([dic[@"code"] integerValue] == 1000){
            [weakSelf.registerView getNumBtnAction];
        }else{
            
            [Help showErrorMessage:[dic objectForKey:@"message"]];
        }
    } error:^(NSError * _Nonnull err) {
        [weakSelf simpleHudHide];
        [Help showErrorMessage:Htjf_Connect_Failure];
    }];
    
}

- (void)requestSmarthomeRegisterUser {
   
    NSDictionary * parameters = @{
    @"phone":_registerView.phoneTextStr,
    @"pwd":_registerView.passwordTextStr,
    @"verifyCode":_registerView.verificationCodeTextStr,
    };
    [self simpleHudShow];
    WS(weakSelf);
    [YNetworkRequest postWithURLString:SmartIOTRegiser parameters:parameters success:^(NSDictionary * _Nonnull dic) {
        [weakSelf simpleHudHide];
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
        [weakSelf simpleHudHide];
        [Help showErrorMessage:Htjf_Connect_Failure];
    }];
}
#pragma mark - -- 其它 --

- (void)dealloc {
    NSLog(@"=");
}
@end
