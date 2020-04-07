//
//  IOTRequestManger.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFamilyModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface IOTRequestManger : NSObject

hc_singleton_h(IOTRequestManger);

/// 家庭列表
@property(nonatomic,strong) TuyaSmartHomeManager * homeManger;

/// 存储家庭列表数据
@property(nonatomic,strong) NSMutableArray * familyDataArray;

/// 请求家庭列表数据
- (void)requestFamilyListData;

/// 启用app登陆成功的时候 需要赋值 记录当前启用的家庭
@property(nonatomic,strong) YFamilyModel * familyModel;

#pragma mark - ---配网
@property(nonatomic,strong) TuyaSmartActivator * activator;




@end

NS_ASSUME_NONNULL_END
