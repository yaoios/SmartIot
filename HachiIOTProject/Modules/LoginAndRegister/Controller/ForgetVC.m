//
//  ForgetVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/1.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "ForgetVC.h"
#import "ForgetView.h"
@interface ForgetVC ()

@property (nonatomic, strong) ForgetView * forgetView;

@end

@implementation ForgetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";
    [self initforgetView];
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
- (void)initforgetView
{
    _forgetView = [[ForgetView alloc] init];
    _forgetView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_forgetView];
    
    WS(weakSelf);
    _forgetView.clickedForgetViewBtn = ^(NSInteger index) {
      
        if (index == 0) {
            
            [weakSelf requestSmarthomeSendVerifyCode];
        }
        else {
            
            [weakSelf requestSmarthomeRegisterUser];
        }
    };
    
    [_forgetView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - -- 代理 --

#pragma mark - -- 点击事件 --

#pragma mark - -- 数据处理 --
- (void)requestSmarthomeSendVerifyCode {
    NSDictionary * parameter = @{@"phone":_forgetView.phoneTextStr,
                              @"type":@"1"
       };
    [self simpleHudShow];
    WS(weakSelf);
    [YNetworkRequest postWithURLString:SmartIOTVerifyCode parameters:parameter success:^(NSDictionary * _Nonnull dic) {
        [weakSelf simpleHudHide];
        if ([dic[@"code"] integerValue] == 1000){
            [weakSelf.forgetView getNumBtnAction];
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
    @"phone":_forgetView.phoneTextStr,
    @"pwd":_forgetView.passwordTextStr,
    @"verifyCode":_forgetView.verificationCodeTextStr,
    };
    [YNetworkRequest postWithURLString:SmartIOTRegiser parameters:parameters success:^(NSDictionary * _Nonnull dic) {
        
    } error:^(NSError * _Nonnull err) {
        
    }];
}
#pragma mark - -- 其它 --
- (void)dealloc {
    NSLog(@"=");
}

@end
