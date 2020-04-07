//
//  YFamilyTableView.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyTableView.h"
#import "YFamilyCell.h"

@interface YFamilyTableView ()<UITableViewDelegate,UITableViewDataSource>


@end

static NSString * YFamilyCellID = @"YFamilyCell";

@implementation YFamilyTableView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setFamilySubView];
    }
    return self;
}

#pragma mark - --- 控件 ---
- (void)setFamilySubView {
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerClass:[YFamilyCell class] forCellReuseIdentifier:YFamilyCellID];
}

#pragma mark - --- 代理 ---
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YFamilyCell *cell = [tableView dequeueReusableCellWithIdentifier:YFamilyCellID forIndexPath:indexPath];
    if (self.dataArray.count > indexPath.row) {
        cell.model = [_dataArray objectAtIndex:indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kRealValue(70);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_dataArray.count > indexPath.row) {
        TuyaSmartHomeModel * model = _dataArray[indexPath.row];
        self.clickFamilyRow(model);
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - 数据处理
- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    
    [self reloadData];
}
@end
