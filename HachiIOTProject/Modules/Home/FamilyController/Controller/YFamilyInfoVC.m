//
//  YFamilyInfoVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyInfoVC.h"
#import "YFamilyInfoTableView.h"
#import "YAddMemberVC.h"
#import "YFamilyMemberVC.h"
#import "YEditorFamilyNameVC.h"
@interface YFamilyInfoVC ()

@property(nonatomic,strong) YFamilyInfoTableView * infoTableView;

@end

@implementation YFamilyInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _model.title;
    [self setUpFamilyInfoSubView];
    [self requestFamilyInfoData];
}

#pragma mark - --- 控件 ---
- (void)setUpFamilyInfoSubView {
    _infoTableView = [[YFamilyInfoTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    WS(weakSelf);
    // 点击事件 0:家庭名称 1:家庭位置 2:家庭成员 3:添加设备
    _infoTableView.familyIndoClickEnvent = ^(NSInteger index) {
        [weakSelf clickEnvent:index];
    };
    
    
    [self.view addSubview:_infoTableView];
    [_infoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    if (_model) {
        _infoTableView.dataModel = _model;
    }
    
}

#pragma mark - --- 点击事件 --
- (void)clickEnvent:(NSInteger)index {
    // 点击事件 0:家庭名称 1:家庭位置 2:家庭成员 3:添加设备
    if (index == 0) {
        YEditorFamilyNameVC * nameVC = [[YEditorFamilyNameVC alloc] init];
        nameVC.model = _model;
        [self.navigationController pushViewController:nameVC animated:YES];
    }else if (index == 1){
        
    }else if (index == 2){
        YFamilyMemberVC * memberVC = [[YFamilyMemberVC alloc] init];
        [self.navigationController pushViewController:memberVC animated:YES];
    }else if (index == 3){
        YAddMemberVC * memberVC = [[YAddMemberVC alloc] init];
        [self.navigationController pushViewController:memberVC animated:YES];
    }
    
     
}

#pragma mark - --- 数据处理 --
- (void)requestFamilyInfoData {
   
}

- (void)dealloc {
//    NSLog(@"==");
}

@end
