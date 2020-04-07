//
//  YEditorFamilyNameVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/7.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YEditorFamilyNameVC.h"
#import "BaseTextField.h"
@interface YEditorFamilyNameVC ()

/// 家庭名称
@property(nonatomic,strong) BaseTextField * nameTextField;


@end

@implementation YEditorFamilyNameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"家庭名称";
    self.view.backgroundColor = [[YColorManger shareYColorManger] getf8f8f8Color];
    [self setUpFamilyNameSubView];
    [self setUpRightNavBarIemWithTarget:self action:@selector(saveAction) title:@"添加"];
}

#pragma mark - --- 控件 ---
- (void)setUpFamilyNameSubView {
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [[YColorManger shareYColorManger] getFFFFFFColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kRealValue(15));
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(kRealValue(40)));
    }];
    
    _nameTextField = [[BaseTextField alloc] init];
    _nameTextField.backgroundColor = [[YColorManger shareYColorManger] getFFFFFFColor];
    _nameTextField.placeholder = @"请输入家庭名称";
    _nameTextField.font = FontSize(15);
    _nameTextField.textColor = [[YColorManger shareYColorManger] getBlackColor];
    _nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameTextField.maxValue = 20;
    _nameTextField.text = _model.title;
    [backView addSubview:_nameTextField];
    [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top);
        make.left.equalTo(backView.mas_left).offset(kRealValue(10));
        make.right.equalTo(backView.mas_right).offset(-kRealValue(10));
        make.bottom.equalTo(backView.mas_bottom);;
    }];
}
#pragma mark - --- 点击事件 --
- (void)saveAction {
    
    [self.view endEditing:YES];
    
    if (_nameTextField.text.length < 1) {
        [Help showMessage:@"名称不能为空"];
        return;
    }
    
    NSMutableDictionary * paremters = [NSMutableDictionary dictionary];
    [paremters setValue:_nameTextField.text forKey:@"title"];
    
    NSDictionary *custDic = @{@"id":_model.customerId.idValue,
                              @"entityType":@"CUSTOMER"
    };
    
    NSDictionary *idDic = @{@"id":_model.familyID.familyID,
                              @"entityType":@"FAMILY"
    };
    
    [paremters setValue:custDic forKey:@"customerId"];
    
    [paremters setValue:idDic forKey:@"id"];
    
    [paremters setValue:@([_model.familyMemberCount integerValue]) forKey:@"familyMemberCount"];
    [paremters setValue:_model.address forKey:@"address"];
    [self simpleHudShow];
    WS(weakSelf);
    [YNetworkRequest postWithURLString:SmartIOTCreatAndEditorHome parameters:paremters success:^(NSDictionary * _Nonnull dic) {
        [weakSelf simpleHudHide];
        if ([dic[@"code"] integerValue] == 1000){
            [Help showMessage:@"修改成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
                
            });
        }else{
            [Help showErrorMessage:[dic objectForKey:@"message"]];
        }
    } error:^(NSError * _Nonnull err) {
        [weakSelf simpleHudHide];
        [Help showErrorMessage:Htjf_Connect_Failure];
    }];
}
#pragma mark - --- 数据处理 --

#pragma mark - --- 其它 --

@end
