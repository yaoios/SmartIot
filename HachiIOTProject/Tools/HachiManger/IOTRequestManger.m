//
//  IOTRequestManger.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "IOTRequestManger.h"

@interface IOTRequestManger ()<TuyaSmartHomeManagerDelegate,TuyaSmartActivatorDelegate>




@end

@implementation IOTRequestManger

hc_singleton_m(IOTRequestManger);

#pragma mark - ---家庭管理---

- (void)requestFamilyListData {
 
    NSDictionary * parmeters = @{@"currentPage":@(1),
                                  @"pageSize":@(10),
                                  @"textSearch":@""
     };
    WS(weakSelf);
    [YNetworkRequest getWithURLString:SmartIOTHomeList parameters:parmeters success:^(NSDictionary * _Nonnull dic) {        
        if ([dic[@"code"] integerValue] == 1000){
            NSDictionary * dicData = [dic objectForKey:@"data"];
            NSArray * dataArr = [dicData objectForKey:@"data"];
            if (dataArr.count > 0) {
                NSDictionary * familyDic = dataArr.firstObject;
                weakSelf.familyModel = [YFamilyModel yy_modelWithDictionary:familyDic];
            }
              
        }
    } error:^(NSError * _Nonnull err) {
        
    }];
}

#pragma mark - ---代理---
#pragma mark TuyaSmartHomeManagerDelegate
/**
 *  the delegate when a new home is added.
 *  新增一个家庭代理回调
 *
 *  @param manager  instance
 *  @param home     homeModel
 */
- (void)homeManager:(TuyaSmartHomeManager *)manager didAddHome:(TuyaSmartHomeModel *)home {
    NSLog(@"新增一个家庭");
}

/**
 *  the delegate when an existing home is removed.
 *  删除一个家庭代理回调
 *
 *  @param manager  instance
 *  @param homeId   homeId
 */
- (void)homeManager:(TuyaSmartHomeManager *)manager didRemoveHome:(long long)homeId {
     NSLog(@"删除一个家庭代理");
}

/**
 *  MQTT connected success
 *  MQTT 服务连接成功代理回调
 */
- (void)serviceConnectedSuccess {
    NSLog(@"连接成功");
}

#pragma mark - ----TuyaSmartActivatorDelegate配网状态更新的回调---
/**
 Callback of Config Network Status Update
 配网状态更新的回调，wifi单品，zigbee网关，zigbee子设备

 @param activator   instance
 @param deviceModel deviceModel
 @param error       error
 */
- (void)activator:(TuyaSmartActivator *)activator didReceiveDevice:(TuyaSmartDeviceModel *)deviceModel error:(NSError *)error {
    
}

#pragma mark - ---懒加载---
- (NSMutableArray *)familyDataArray {
    if (_familyDataArray == nil) {
        _familyDataArray = [NSMutableArray array];
    }
    return _familyDataArray;
}

- (TuyaSmartHomeManager *)homeManger {
    if (_homeManger == nil) {
        _homeManger = [TuyaSmartHomeManager new];
        _homeManger.delegate = self;
    }
    return _homeManger;
}

- (TuyaSmartActivator *)activator {
    if (_activator == nil) {
        _activator = [TuyaSmartActivator sharedInstance];
        _activator.delegate = self;
    }
    return _activator;
}

@end
