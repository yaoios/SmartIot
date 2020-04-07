//
//  LoginView.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "LoginView.h"
#import "BaseTextField.h"
@interface LoginView ()

/// 电话
@property(nonatomic,strong) BaseTextField * phoneTextField;

/// 密码
@property(nonatomic,strong) BaseTextField * passwordTextField;

/// 密码隐藏按钮
@property (nonatomic, strong) UIButton * secureInputBtn;

/// 登陆
@property (nonatomic, strong) UIButton * loginBtn;

/// 忘记密码
@property(nonatomic,strong) UIButton * forgetBtn;

/// 注册按钮
@property(nonatomic,strong) UIButton * registerBtn;


@end

@implementation LoginView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpLoginView];
    }
    return self;
}

- (void)setUpLoginView {
    UIImageView * iconImage = [[UIImageView alloc] init];
    iconImage.backgroundColor = [UIColor clearColor];
    iconImage.image = [UIImage imageNamed:@"Login_logo"];
    [self addSubview:iconImage];
    
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
           
        make.top.equalTo(self).offset(kRealValue(21) + Height_NavBar);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(kRealValue(90), kRealValue(90)));
    }];
    
    
    [self addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImage.mas_bottom).offset(kRealValue(47));
        make.left.equalTo(self).offset(kRealValue(40));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.height.mas_equalTo(kRealValue(55));
    }];
    
    //电话图标
    UIImageView * phoneImageView = [[UIImageView alloc] init];
    phoneImageView.backgroundColor = [UIColor clearColor];
    phoneImageView.image = [UIImage imageNamed:@"Login_Phone"];
    [self addSubview:phoneImageView];
    
    [phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.phoneTextField); make.right.equalTo(self.phoneTextField.mas_left).offset(kRealValue(-5));
        make.size.mas_equalTo(CGSizeMake(kRealValue(20), kRealValue(20)));
    }];
    
    
    [self addSubview:self.passwordTextField];
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.phoneTextField.mas_bottom).offset(kRealValue(0));
        make.left.equalTo(self).offset(kRealValue(40));
        make.right.equalTo(self).offset(kRealValue(-50));
        make.height.mas_equalTo(kRealValue(55));
    }];
    
    //密码图标
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"SetUp_PassWord"];
    [self addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.passwordTextField); make.right.equalTo(self.passwordTextField.mas_left).offset(kRealValue(-5));
        make.size.mas_equalTo(CGSizeMake(kRealValue(20), kRealValue(20)));
    }];
    
    //添加切换密文图标按钮
    [self addSubview:self.secureInputBtn];
    [_secureInputBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.height.equalTo(self.passwordTextField);
        make.right.equalTo(self).offset(kRealValue(-15));
        make.width.mas_equalTo(kRealValue(30));
    }];
    
    //添加登陆
    [self addSubview:self.loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
           make.top.equalTo(self.passwordTextField.mas_bottom).offset(kRealValue(35));
           make.left.equalTo(self).offset(kRealValue(15));
           make.right.equalTo(self).offset(kRealValue(-15));
           make.height.mas_equalTo(kRealValue(44));
       }];
    
    //忘记密码
    [self addSubview:self.forgetBtn];
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.loginBtn.mas_bottom).offset(kRealValue(20));
        make.left.equalTo(self).offset(kRealValue(15));
        make.height.mas_equalTo(kRealValue(34));
        make.width.mas_greaterThanOrEqualTo(20);
    }];
    
    //zhu ce
    [self addSubview:self.registerBtn];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.loginBtn.mas_bottom).offset(kRealValue(20));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.height.mas_equalTo(kRealValue(34));
        make.width.mas_greaterThanOrEqualTo(20);
    }];
    
    //分割线
    UIView * separatedView = [[UIView alloc] init];
    separatedView.backgroundColor = [[YColorManger shareYColorManger] getecececColor];
    [self addSubview:separatedView];
    
    [separatedView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(kRealValue(15));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.bottom.equalTo(self.phoneTextField).offset(kRealValue(0));
        make.height.mas_equalTo(0.5);
    }];
    
    UIView * separatedView2 = [[UIView alloc] init];
    separatedView2.backgroundColor = [[YColorManger shareYColorManger] getecececColor];
    [self addSubview:separatedView2];
    
    [separatedView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(kRealValue(15));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.bottom.equalTo(self.passwordTextField).offset(kRealValue(0));
        make.height.mas_equalTo(0.5);
    }];
}

#pragma mark --- 点击事件

//登录
- (void)clickedLoginBtn:(UIButton *)sender {
    _phoneTextStr = _phoneTextField.text;
    _passwordTextStr = _passwordTextField.text;
       
    self.clickedLoginViewBtns(0);
       
    [self endEditing:YES];
}

//密码明文显示
- (void)clickedSecureInputBtn:(UIButton *)btn {
   
    btn.selected = !btn.isSelected;
    
    _passwordTextField.secureTextEntry = btn.isSelected;
}

//忘记密码
- (void)clickedForgotPasswordBtn {
    self.clickedLoginViewBtns(1);
    
    [self endEditing:YES];
}

//注册clickedRegisteredBtn
- (void)clickedRegisteredBtn {
    self.clickedLoginViewBtns(2);
    
    [self endEditing:YES];
}

#pragma mark ---监听输入

-(void)phoneTextFieldDidChange:(UITextField *)textField{
    
    NSUInteger textWidth = 11;
    NSString *toBeString = textField.text;
    NSString *lang = [textField.textInputMode primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];       //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > textWidth) {
                textField.text = [toBeString substringToIndex:textWidth];
            }
        }       // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
        }
    }// 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况   else{
    
    else {
        if (toBeString.length > textWidth) {
            
            textField.text = [toBeString substringToIndex:textWidth];
        }
    }
    
    [self loginBtnState];
}

-(void)passwordTextFieldDidChange:(UITextField *)textField{
    
    NSUInteger textWidth = 20;
    NSString *toBeString = textField.text;
    NSString *lang = [textField.textInputMode primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];       //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > textWidth) {
                textField.text = [toBeString substringToIndex:textWidth];
            }
        }       // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
        }
    }// 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况   else{
    
    else {
        if (toBeString.length > textWidth) {
            
            textField.text = [toBeString substringToIndex:textWidth];
        }
    }
    
    [self loginBtnState];
}

- (void)loginBtnState
{
    if (_phoneTextField.text.length == 11 && _passwordTextField.text.length >= 8) {
        
        [_loginBtn setBackgroundColor:[[YColorManger shareYColorManger] getdf2d1fColor]];
        _loginBtn.enabled = YES;
    }
    else {
        
        [_loginBtn setBackgroundColor:[[YColorManger shareYColorManger] getd8d8d8Color]];
        _loginBtn.enabled = NO;
    }
}


- (BaseTextField *)phoneTextField {
    if (_phoneTextField == nil) {
        _phoneTextField = [[BaseTextField alloc] init];
        _phoneTextField.backgroundColor = [UIColor clearColor];
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextField.placeholder = @"请输入手机号码";
        _phoneTextField.font = FontSize(15);
        _phoneTextField.textColor = [[YColorManger shareYColorManger] getBlackColor];
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTextField.text = @"";
        [_phoneTextField addTarget:self action:@selector(phoneTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _phoneTextField;
}

- (BaseTextField *)passwordTextField {
    if (_passwordTextField == nil) {
        _passwordTextField = [[BaseTextField alloc] init];
        _passwordTextField.backgroundColor = [UIColor clearColor];
        _passwordTextField.keyboardType = UIKeyboardTypeAlphabet;
        _passwordTextField.background = [UIImage imageNamed:@""];
        _passwordTextField.disabledBackground = [UIImage imageNamed:@""]; //设置背景
        _passwordTextField.placeholder = @"请输入8-20位密码";
        _passwordTextField.font = FontSize(14);
        _passwordTextField.textColor = [[YColorManger shareYColorManger] getBlackColor];
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.text = @"";
        _passwordTextField.secureTextEntry = YES; //密文输入 *
        _passwordTextField.clearsOnBeginEditing = NO;
        [_passwordTextField addTarget:self action:@selector(passwordTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _passwordTextField;
}

- (UIButton *)loginBtn {
    if (_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setBackgroundColor:[[YColorManger shareYColorManger] getd8d8d8Color]];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[[YColorManger shareYColorManger] getFFFFFFColor] forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = FontSize(16);
        [_loginBtn addTarget:self action:@selector(clickedLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.enabled = NO;
        _loginBtn.layer.cornerRadius = 4;
    }
    return _loginBtn;
}

- (UIButton *)secureInputBtn {
    if (_secureInputBtn == nil) {
        _secureInputBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_secureInputBtn setBackgroundColor:[UIColor clearColor]];
        [_secureInputBtn setImage:[UIImage imageNamed:@"SetUp_ShowPassword"] forState:UIControlStateNormal];
        [_secureInputBtn setImage:[UIImage imageNamed:@"SetUp_HiddenPassword"] forState:UIControlStateSelected];
        _secureInputBtn.selected = YES;
        [_secureInputBtn addTarget:self action:@selector(clickedSecureInputBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_secureInputBtn];
    }
    return _secureInputBtn;
}

- (UIButton *)forgetBtn {
    if (_forgetBtn == nil) {
        _forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetBtn setBackgroundColor:[UIColor clearColor]];
        [_forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:[[YColorManger shareYColorManger] get505050Color] forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = FontSize(14);
        [_forgetBtn addTarget:self action:@selector(clickedForgotPasswordBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}

- (UIButton *)registerBtn {
    if (_registerBtn == nil) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setBackgroundColor:[UIColor clearColor]];
        [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[[YColorManger shareYColorManger] get505050Color] forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = FontSize(14);
        [_registerBtn addTarget:self action:@selector(clickedRegisteredBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _registerBtn;
}

@end
