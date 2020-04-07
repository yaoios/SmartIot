//
//  ForgetView.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/1.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ForgetView : BaseView

/// 用户账号
@property (nonatomic, copy) NSString * phoneTextStr;

/// 验证码
@property (nonatomic, copy) NSString * verificationCodeTextStr;

/// 密码
@property (nonatomic, copy) NSString * passwordTextStr;

/// 点击事件 0:获取验证码 1:注册
@property (nonatomic, copy) void (^clickedForgetViewBtn)(NSInteger index);

/// 验证码倒计时
- (void)getNumBtnAction;

@end

NS_ASSUME_NONNULL_END
