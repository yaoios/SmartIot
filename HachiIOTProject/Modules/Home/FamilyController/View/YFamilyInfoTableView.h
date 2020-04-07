//
//  YFamilyInfoTableView.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFamilyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YFamilyInfoTableView : UITableView

/// 房间个数
@property(nonatomic,strong) NSMutableArray * roomArray;

/// 点击事件 0:家庭名称 1:家庭位置 2:家庭成员 3:添加设备
@property(nonatomic,copy)  void (^familyIndoClickEnvent)(NSInteger index);

@property(nonatomic,strong) YFamilyModel * dataModel;


@end

NS_ASSUME_NONNULL_END
