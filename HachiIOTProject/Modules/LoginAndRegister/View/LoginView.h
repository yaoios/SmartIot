//
//  LoginView.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : BaseView

/// 账号
@property (nonatomic, copy) NSString * phoneTextStr;

/// 密码
@property (nonatomic, copy) NSString * passwordTextStr;

/// 登陆页面点击事件 0:登陆，1:忘记密码，2:注册
@property (nonatomic, copy) void (^clickedLoginViewBtns)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
