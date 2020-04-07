//
//  RegisterView.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/1.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "RegisterView.h"
#import "BaseTextField.h"
@interface RegisterView ()
{
    dispatch_source_t dispatchTimer;
}
/// 电话
@property(nonatomic,strong) BaseTextField * phoneTextField;

/// 密码
@property(nonatomic,strong) BaseTextField * passwordTextField;

/// 验证码
@property(nonatomic,strong) BaseTextField * verifyCodeTextField;

/// 验证码按钮
@property (nonatomic, strong) UIButton * verificationCodeBtn;

/// 密文按钮
@property (nonatomic, strong) UIButton * secureInputBtn;

/// 倒计时
@property (nonatomic, strong) UILabel * promptLabel;

/// 注册按钮
@property (nonatomic, strong) UIButton * submitBtn;



@end

@implementation RegisterView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupregisterView];
    }
    return self;
}

#pragma mark - ---控件---
- (void)setupregisterView {
    
    [self addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kRealValue(15));
        make.left.equalTo(self).offset(kRealValue(40));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.height.mas_equalTo(kRealValue(55));
    }];
    
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"Login_Phone"];
    [self addSubview:imageView];
       
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
           
        make.centerY.equalTo(self.phoneTextField);
        make.right.equalTo(self.phoneTextField.mas_left).offset(kRealValue(-5));
        make.size.mas_equalTo(CGSizeMake(kRealValue(20), kRealValue(20)));
    }];
    
    [self addSubview:self.verifyCodeTextField];
    [self.verifyCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.mas_bottom).offset(kRealValue(0));
        make.left.equalTo(self).offset(kRealValue(40));
        make.right.equalTo(self).offset(kRealValue(-110));
        make.height.mas_equalTo(kRealValue(55));
    }];
    
    UIImageView * verifiImageView = [[UIImageView alloc] init];
    verifiImageView.backgroundColor = [UIColor clearColor];
    verifiImageView.image = [UIImage imageNamed:@"SetUp_VerificationCode"];
    [self addSubview:verifiImageView];
    
    [verifiImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.verifyCodeTextField);
        make.right.equalTo(self.verifyCodeTextField.mas_left).offset(kRealValue(-5));
        make.size.mas_equalTo(CGSizeMake(kRealValue(20), kRealValue(20)));
    }];
    
    [self addSubview:self.verificationCodeBtn];
    [_verificationCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
        make.centerY.height.equalTo(_verifyCodeTextField);
        make.right.equalTo(self).offset(kRealValue(-15));
        make.width.mas_equalTo(kRealValue(95));
    }];
    
    [self addSubview:self.passwordTextField];
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.verifyCodeTextField.mas_bottom).offset(kRealValue(0));
        make.left.equalTo(self).offset(kRealValue(40));
        make.right.equalTo(self).offset(kRealValue(-50));
        make.height.mas_equalTo(kRealValue(55));
    }];
    
    UIImageView * passImageView = [[UIImageView alloc] init];
    passImageView.backgroundColor = [UIColor clearColor];
    passImageView.image = [UIImage imageNamed:@"SetUp_PassWord"];
    [self addSubview:passImageView];
    [passImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.passwordTextField); make.right.equalTo(self.passwordTextField.mas_left).offset(kRealValue(-5));
        make.size.mas_equalTo(CGSizeMake(kRealValue(20), kRealValue(20)));
    }];
    
    [self addSubview:self.secureInputBtn];
    [_secureInputBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.height.equalTo(self.passwordTextField);
        make.right.equalTo(self).offset(kRealValue(-15));
        make.width.mas_equalTo(kRealValue(30));
    }];
    
    [self addSubview:self.promptLabel];
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(kRealValue(20));
        make.left.equalTo(self).offset(kRealValue(15));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.height.mas_greaterThanOrEqualTo(kRealValue(15));
    }];
    
    [self addSubview:self.submitBtn];
    [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.promptLabel.mas_bottom).offset(kRealValue(35));
        make.left.equalTo(self).offset(kRealValue(15));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.height.mas_equalTo(kRealValue(44));
    }];
    
    UIView * separatedView = [[UIView alloc] init];
      separatedView.backgroundColor = [[YColorManger shareYColorManger] getecececColor];
    [self addSubview:separatedView];
      
    [separatedView mas_makeConstraints:^(MASConstraintMaker *make) {
          
        make.left.equalTo(self).offset(kRealValue(15));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.bottom.equalTo(_phoneTextField).offset(kRealValue(0));
        make.height.mas_equalTo(0.5);
    }];
      
    UIView * separatedView2 = [[UIView alloc] init];
    separatedView2.backgroundColor = [[YColorManger shareYColorManger] getecececColor];
    [self addSubview:separatedView2];
      
    [separatedView2 mas_makeConstraints:^(MASConstraintMaker *make) {
          
        make.left.equalTo(self).offset(kRealValue(15));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.bottom.equalTo(_verifyCodeTextField).offset(kRealValue(0));
          make.height.mas_equalTo(0.5);
    }];
      
    UIView * separatedView3 = [[UIView alloc] init];
    separatedView3.backgroundColor = [[YColorManger shareYColorManger] getecececColor];
    [self addSubview:separatedView3];
      
    [separatedView3 mas_makeConstraints:^(MASConstraintMaker *make) {
          
        make.left.equalTo(self).offset(kRealValue(15));
        make.right.equalTo(self).offset(kRealValue(-15));
        make.bottom.equalTo(_passwordTextField).offset(kRealValue(0));
        make.height.mas_equalTo(0.5);
    }];
      
    //获取验证码按钮左边竖线
    UIView * separatedView4 = [[UIView alloc] init];
    separatedView4.backgroundColor = [[YColorManger shareYColorManger] getc5c5c5Color];
    [self addSubview:separatedView4];
      
    [separatedView4 mas_makeConstraints:^(MASConstraintMaker *make) {
          
          make.centerY.equalTo(self.verifyCodeTextField).offset(kRealValue(0));
          make.right.equalTo(self.verificationCodeBtn.mas_left).offset(kRealValue(0));
          make.size.mas_equalTo(CGSizeMake(0.5, kRealValue(25)));
      }];
}



#pragma mark - ---点击事件---
//验证码
- (void)clickedVerificationCodeBtn:(UIButton *)btn {
    _phoneTextStr = _phoneTextField.text;
    self.clickedRegisteredViewBtn(0);
}

//密文
- (void)clickedSecureInputBtn:(UIButton *)btn {
    btn.selected = !btn.isSelected;
    
    _passwordTextField.secureTextEntry = btn.isSelected;
}

//提交
- (void)clickedSubmitBtn:(UIButton *)btn {
    _phoneTextStr = _phoneTextField.text;
    _verificationCodeTextStr = _verifyCodeTextField.text;
    _passwordTextStr = _passwordTextField.text;
    
    self.clickedRegisteredViewBtn(1);
    [self endEditing:YES];    
}

- (void)getNumBtnAction
{
    //自动升起验证码键盘
    [_verifyCodeTextField becomeFirstResponder];
    WS(weakSelf);
    __block NSInteger second = 60;
    //全局队列    默认优先级
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时器模式  事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    //NSEC_PER_SEC是秒，＊1是每秒
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        //回调主线程，在主线程中操作UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second >= 0) {
                
                [weakSelf.verificationCodeBtn setUserInteractionEnabled:NO];
                [weakSelf.verificationCodeBtn setTitleColor:[[YColorManger shareYColorManger] get909090Color] forState:UIControlStateNormal];
                [weakSelf.verificationCodeBtn setTitle:[NSString stringWithFormat:@"%lds后重试",second] forState:UIControlStateNormal];
                second--;
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timer);
                [weakSelf.verificationCodeBtn setUserInteractionEnabled:YES];
                [weakSelf.verificationCodeBtn setTitleColor:[[YColorManger shareYColorManger] getdf2d1fColor] forState:UIControlStateNormal];
                [weakSelf.verificationCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                
            }
        });
    });
    dispatchTimer = timer;
    //启动源
    dispatch_resume(timer);
}

#pragma mark - ---代理---
-(void)phoneTextFieldDidChange:(UITextField *)textField{
    
    NSUInteger textWidth = textField == _phoneTextField ? 11 : 4;
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
    
    if (_phoneTextField.text.length == 11) {
        
        [_verificationCodeBtn setTitleColor:[[YColorManger shareYColorManger] getdf2d1fColor] forState:UIControlStateNormal];
        _verificationCodeBtn.userInteractionEnabled = YES;
    }
    else {
        
        [_verificationCodeBtn setTitleColor:[[YColorManger shareYColorManger] get909090Color] forState:UIControlStateNormal];
        _verificationCodeBtn.userInteractionEnabled = NO;
    }
    
    [self registeredBtnState];
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
    
    [self registeredBtnState];
}

- (void)registeredBtnState
{
    if (_phoneTextField.text.length == 11 && _verifyCodeTextField.text.length >= 4 && _passwordTextField.text.length >= 8) {
        
        [_submitBtn setBackgroundColor:[[YColorManger shareYColorManger] getdf2d1fColor]];
        _submitBtn.enabled = YES;
    }
    else {
        
        [_submitBtn setBackgroundColor:[[YColorManger shareYColorManger] getd8d8d8Color]];
        _submitBtn.enabled = NO;
    }
}

#pragma mark - ---其它---
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

- (BaseTextField *)verifyCodeTextField {
    if (_verifyCodeTextField == nil) {
        _verifyCodeTextField = [[BaseTextField alloc] init];
        _verifyCodeTextField.backgroundColor = [UIColor clearColor];
        _verifyCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
        _verifyCodeTextField.placeholder = @"请输入验证码";
        _verifyCodeTextField.font = FontSize(14);
        _verifyCodeTextField.textColor = [[YColorManger shareYColorManger] getBlackColor];
        _verifyCodeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _verifyCodeTextField.text = @"";
        [_verifyCodeTextField addTarget:self action:@selector(phoneTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _verifyCodeTextField;
}

- (UIButton *)verificationCodeBtn {
    if (_verificationCodeBtn == nil) {
        _verificationCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_verificationCodeBtn setBackgroundColor:[UIColor clearColor]];
        [_verificationCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_verificationCodeBtn setTitleColor:[[YColorManger shareYColorManger] get909090Color] forState:UIControlStateNormal];
        _verificationCodeBtn.titleLabel.font = FontSize(13);
        [_verificationCodeBtn addTarget:self action:@selector(clickedVerificationCodeBtn:) forControlEvents:UIControlEventTouchUpInside];
        _verificationCodeBtn.userInteractionEnabled = NO;
        
    }
    return _verificationCodeBtn;
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

- (UIButton *)submitBtn {
    if (_submitBtn == nil) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitBtn setBackgroundColor:[[YColorManger shareYColorManger] getd8d8d8Color]];
        [_submitBtn setTitle:@"提交注册" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:[[YColorManger shareYColorManger] getFFFFFFColor] forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = FontSize(14);
        [_submitBtn addTarget:self action:@selector(clickedSubmitBtn:) forControlEvents:UIControlEventTouchUpInside];
        _submitBtn.enabled = NO;
        _submitBtn.layer.cornerRadius = 4;
        
    }
    return _submitBtn;
}

- (UILabel *)promptLabel {
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.backgroundColor = [UIColor clearColor];
        _promptLabel.text = @"密码支持大小写字母、数字或特殊字符，不支持表情/空格/全角符号。";
        _promptLabel.textColor = [[YColorManger shareYColorManger] get808080Color];
        _promptLabel.textAlignment = NSTextAlignmentLeft;
        _promptLabel.font = FontSize(13);
        _promptLabel.numberOfLines = 0;
    }
    return _promptLabel;
}

- (void)dealloc {
    if (dispatchTimer) {
        dispatch_cancel(dispatchTimer);
        dispatchTimer = NULL;
    }
}
@end
