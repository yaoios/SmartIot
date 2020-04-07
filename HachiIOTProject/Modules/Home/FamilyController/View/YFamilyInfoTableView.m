//
//  YFamilyInfoTableView.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyInfoTableView.h"
#import "YFamilyInfoCell.h"
#import "YRoomCollectionView.h"
@interface YFamilyInfoTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

static NSString * YFamilyInfoCellID = @"YFamilyInfoCell";

@implementation YFamilyInfoTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setFamilyInfoSubView];
    }
    return self;
}



#pragma mark - --- 控件 ---
- (void)setFamilyInfoSubView {
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerClass:[YFamilyInfoCell class] forCellReuseIdentifier:YFamilyInfoCellID];
}

#pragma mark - --- 代理 ---
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
         return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YFamilyInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:YFamilyInfoCellID forIndexPath:indexPath];
    
    if (indexPath.section == 1) {
        [cell setRoomAndDeviceSubView];
        WS(weakSelf);
        cell.familyInfoAddDevice = ^{
            [weakSelf clickFamiluEnvent:3];
        };
    }else{
        if (indexPath.row == 0) {
            cell.nameValue = _dataModel.title;
        }else if (indexPath.row == 1){
            cell.locationValue = _dataModel.address;
        }else if (indexPath.row == 2){
            cell.callValue = _dataModel.familyMemberCount;
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
       return kRealValue(70);
    }else{
      return kRealValue(300);
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
       
        if (indexPath.row == 0) {
            
            [self clickFamiluEnvent:0];
            
        }else if (indexPath.row == 1){
            
            [self clickFamiluEnvent:1];
            
        }else if (indexPath.row == 2){
          
            [self clickFamiluEnvent:2];
        }
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * headerView = [[UIView alloc] init];
    if (section == 0) {
        headerView.frame = CGRectMake(0, 0, kScreenWidth, kRealValue(100));
        UIImageView * iconImage = [[UIImageView alloc] init];
        iconImage.backgroundColor = [UIColor redColor];
        [headerView addSubview:iconImage];
        [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(headerView);
        }];
    }else{
        headerView.frame = CGRectMake(0, 0, kScreenWidth, kRealValue(40));
       
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.text = @"房间和设备";
        nameLabel.font = [UIFont systemFontOfSize:17];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.textColor = [[YColorManger shareYColorManger] getBlackColor];
        [headerView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(headerView);
            make.left.equalTo(headerView.mas_left).offset(kRealValue(15));
            make.height.equalTo(@(kRealValue(20)));
        }];
    }
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
   
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
       return kRealValue(100);
    }else{
       return kRealValue(40);
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
       
    return 0.01;
}

#pragma mark - 点击事件
- (void)clickFamiluEnvent:(NSInteger)index {
    //0:家庭名称 1:家庭位置 2:家庭成员 3:添加设备
    self.familyIndoClickEnvent(index);
}

#pragma mark - 数据处理
- (void)setRoomArray:(NSMutableArray *)roomArray {
    _roomArray = roomArray;
    [self reloadData];
}

- (void)setDataModel:(YFamilyModel *)dataModel {
    _dataModel = dataModel;
    [self reloadData];
}

@end
