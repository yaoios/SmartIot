//
//  YFamilyMemberTableView.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyMemberTableView.h"
#import "YFamilyMemberCell.h"
@interface YFamilyMemberTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

static NSString * YFamilyMemberCellID = @"YFamilyMemberCell";

@implementation YFamilyMemberTableView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setFamilyMemberInfoSubView];
    }
    return self;
}

#pragma mark - --- 控件 ---
- (void)setFamilyMemberInfoSubView {
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerClass:[YFamilyMemberCell class] forCellReuseIdentifier:YFamilyMemberCellID];
}

#pragma mark - --- 代理 ---
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _memberDataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YFamilyMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:YFamilyMemberCellID forIndexPath:indexPath];
    if (self.memberDataArray.count > indexPath.row) {
        cell.menberModel = [_memberDataArray objectAtIndex:indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kRealValue(70);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_memberDataArray.count > indexPath.row) {
//        TuyaSmartHomeMemberModel * model = _memberDataArray[indexPath.row];
//        self.clickFamilyRow(model);
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView * backView = [[UIView alloc] init];
    backView.backgroundColor = [[YColorManger shareYColorManger] getf8f8f8Color];
    backView.frame = CGRectMake(0, 0, kScreenWidth, kRealValue(80));
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(addBtn) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"添加成员" forState:UIControlStateNormal];
    [btn setTitleColor:[[YColorManger shareYColorManger] getBlackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [[YColorManger shareYColorManger] getFFFFFFColor];
    [backView addSubview:btn];
    btn.frame = CGRectMake(0, 0, kScreenWidth, 40);
    btn.center = backView.center;
    return backView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return kRealValue(80);
}

#pragma mark - 点击事件
- (void)addBtn {
    self.addFamilyMember();
}

#pragma mark - 数据处理
- (void)setMemberDataArray:(NSMutableArray<TuyaSmartHomeMemberModel *> *)memberDataArray {
    _memberDataArray = memberDataArray;
    
    [self reloadData];
}



@end
