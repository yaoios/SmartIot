//
//  BaseTextField.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "BaseTextField.h"

@interface BaseTextField ()<UITextFieldDelegate>

@end

@implementation BaseTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = self;
        self.returnKeyType =  UIReturnKeyDone;
    }
    return self;
}


- (void)setMaxValue:(NSInteger)maxValue {
    _maxValue = maxValue;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:self];
}

- (void)removeTextDidChangeNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:nil];
}

-(void)textFiledEditChanged:(NSNotification*)obj {
    UITextField *testField = (UITextField *)obj.object;
    NSInteger kMaxLength = _maxValue;
    NSString *toBeString = testField.text;
    
    if ([Help isContainsTwoEmoji:toBeString]) {
        toBeString = [toBeString substringToIndex:testField.text.length - 2];
        testField.text = toBeString;
    }
    NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage; //ios7之前使用[UITextInputMode currentInputMode].primaryLanguage
    if ([lang isEqualToString:@"zh-Hans"]) { //中文输入
        UITextRange *selectedRange = [testField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [testField positionFromPosition:selectedRange.start offset:0];
        if (!position) {// 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (toBeString.length > kMaxLength) {
                testField.text = [toBeString substringToIndex:kMaxLength];
            }
        }
        else{//有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    }else{//中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > kMaxLength) {
            testField.text = [toBeString substringToIndex:kMaxLength];
        }
    }
}

#pragma mark -UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    // 不让输入表情
    if ([textField isFirstResponder]) {
        if ([[[textField textInputMode] primaryLanguage] isEqualToString:@"emoji"] || ![[textField textInputMode] primaryLanguage]) {
            return NO;
        }
    }
    
    if ([string isEqualToString:@" "]) {
        
        return NO;
    }
    
    //判断键盘是不是九宫格键盘
    if ([Help isNineKeyBoard:string]) {
        return YES;
    }else{
        if ([Help isContainsTwoEmoji:string] || [Help hasEmoji:string]) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
