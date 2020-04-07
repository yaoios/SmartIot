//
//  YFamilyTableView.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFamilyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YFamilyTableView : UITableView


/// 数据
@property(nonatomic,strong) NSMutableArray<YFamilyModel *> * dataArray;

/// 点击房间事件
@property(nonatomic,copy)  void (^clickFamilyRow)(YFamilyModel *model);

@end

NS_ASSUME_NONNULL_END
