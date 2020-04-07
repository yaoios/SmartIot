//
//  SmartStorageModel.m
//  hachiSmartHome
//
//  Created by xuguangyao on 2018/1/15.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "SmartStorageModel.h"
#import "YTKKeyValueStore.h"
#define IsSmartHomeTable @"SmartHomeTable"//智能家居所以数据 以字典方式存储
#define SmartIotUserTable @"SmartIotUserInfoTable"

@implementation SmartStorageModel
//单例
hc_singleton_m(SmartStorageModel)

#pragma mark -字典存储 取出
- (void)storageStatisticsDataDic:(NSDictionary*)dic withType:(SmartIotStorageType)type withIphone:(NSString*)phone
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"SmartData.db"];
    
    if (type == SmartStorage_AllData) {
        
        [store createTableWithName:IsSmartHomeTable];
        [store putObject:dic withId:@"smartHomeKey" intoTable:IsSmartHomeTable];
        
    }
//    else if (type == SmartStorage_GateWayData) {
//
//        [store createTableWithName:IsSmartGateWayTable];
//        NSString *keyStr = [NSString stringWithFormat:@"%@smartGateWayKey",phone];
//        [store putObject:dic withId:keyStr intoTable:IsSmartGateWayTable];
//
//    }
    
    [store close];
}

//取出
- (NSDictionary*)takeoutDicDataStatisticswithType:(SmartIotStorageType)type withIphone:(NSString*)phone
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"SmartData.db"];
    NSDictionary *dic;
    if (type == SmartStorage_AllData) {
        
         dic = [store getObjectById:@"smartHomeKey" fromTable:IsSmartHomeTable];
    
        
    }
//    else if (type == SmartStorage_GateWayData) {
//         NSString *keyStr = [NSString stringWithFormat:@"%@smartGateWayKey",phone];
//         dic = [store getObjectById:keyStr fromTable:IsSmartGateWayTable];
//
//    }
    return dic;
}

#pragma mark -删除
/*
 * 删除数据 type 为类别
 */
- (void)deleteStatisticsDatawithType:(SmartIotStorageType)type withIphone:(NSString*)phone
{
     YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"SmartData.db"];
    if (type == SmartStorage_AllData) {
       
         [store deleteObjectById:@"smartHomeKey" fromTable:IsSmartHomeTable];
        
    }
//    else if (type == SmartStorage_GateWayData) {
//          NSString *keyStr = [NSString stringWithFormat:@"%@smartGateWayKey",phone];
//        [store deleteObjectById:keyStr fromTable:IsSmartGateWayTable];
//
//    }
}

#pragma mark - ----存储用户信息到本地-----
- (void)storageUserInfo:(NSDictionary *)dic {
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"SmartData.db"];
    [store createTableWithName:SmartIotUserTable];
    [store putObject:dic withId:@"smartUserKey" intoTable:SmartIotUserTable];
    [store close];
}

#pragma mark - ----本地取出用户信息-----
- (BOOL)takeoutUserInfoFromStorage {
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"SmartData.db"];
    NSDictionary * dic = [store getObjectById:@"smartUserKey" fromTable:SmartIotUserTable];
    if (dic) {
        UserModel * model = [UserModel yy_modelWithDictionary:dic];
        [UserModel shareUserModel].refreshToken = model.refreshToken;
        [UserModel shareUserModel].token = model.token;
        [UserModel shareUserModel].user = model.user;
        return YES;
    }else{
        return NO;
    }
}
@end
