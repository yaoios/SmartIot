//
//  SmartStorageModel.h
//  hachiSmartHome
//
//  Created by xuguangyao on 2018/1/15.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
typedef NS_ENUM(NSInteger,SmartIotStorageType) {
    SmartStorage_AllData = 1,//存储接口请求所有数据（接口返回）以字典方式存储
};

@interface SmartStorageModel : NSObject
//创建单例对像
hc_singleton_h(SmartStorageModel);

/*
 * 存储数据 type 为类别， phone 手机号
 */
- (void)storageStatisticsDataDic:(NSDictionary*)dic withType:(SmartIotStorageType)type withIphone:(NSString*)phone;

/*
 * 取出数据 type 为类别， phone 手机号
 */
- (NSDictionary*)takeoutDicDataStatisticswithType:(SmartIotStorageType)type withIphone:(NSString*)phone;

/*
 * 删除数据 type 为类别， phone 手机号
 */
- (void)deleteStatisticsDatawithType:(SmartIotStorageType)type withIphone:(NSString*)phone;



/// 存储登陆返回的用户信息到本地
/// @param dic 用户信息
- (void)storageUserInfo:(NSDictionary *)dic;

/// 从本地取出用户数据
- (BOOL)takeoutUserInfoFromStorage;

@end
