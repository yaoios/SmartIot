//
//  YFamilyMemberVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyMemberVC.h"
#import "YFamilyMemberTableView.h"
#import "YAddMemberVC.h"
@interface YFamilyMemberVC ()

@property(nonatomic,strong) YFamilyMemberTableView * memberTableView;

@end

@implementation YFamilyMemberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"家庭成员";
    [self setUpFamilyInfoSubView];
    [self requestFamilyInfoData];
}

#pragma mark - --- 控件 ---
- (void)setUpFamilyInfoSubView {
    _memberTableView = [[YFamilyMemberTableView alloc] init];
    WS(weakSelf);
    _memberTableView.addFamilyMember = ^{
        [weakSelf addMemberEnvent];
    };
    _memberTableView.clickFamilyMemberInfoRow = ^(TuyaSmartHomeMemberModel * _Nonnull model) {
        
    };
    [self.view addSubview:_memberTableView];
    [_memberTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
}

#pragma mark - --- 点击事件 --
- (void)addMemberEnvent {
    YAddMemberVC * memberVC = [[YAddMemberVC alloc] init];
    [self.navigationController pushViewController:memberVC animated:YES];
}

#pragma mark - --- 数据处理 --
- (void)requestFamilyInfoData {
   
    TuyaSmartHome * homes = [TuyaSmartHome homeWithHomeId:self.homeID];
    WS(weakSelf);
    [homes getHomeMemberListWithSuccess:^(NSArray<TuyaSmartHomeMemberModel *> *memberList) {
        if (memberList.count > 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.memberTableView.memberDataArray = [NSMutableArray arrayWithArray:memberList];
            });
        }
    } failure:^(NSError *error) {
        
    }];
   
    NSLog(@"%@",homes);
}


@end
