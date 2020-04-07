//
//  YFamilyModel.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/3.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class FamilyIdModel;
@interface YFamilyModel : NSObject

/// 涂鸦的homeID 配网用到
@property(nonatomic,copy)  NSString *cloudHomeId;

@property(nonatomic,copy)  NSString *additionalInfo;

@property(nonatomic,copy)  NSString *address;

@property(nonatomic,copy)  NSString *authTime;

@property(nonatomic,copy)  NSString *authVillage;

@property(nonatomic,copy)  NSString *createTime;


/// 设备数量
@property(nonatomic,copy)  NSString *deviceNum;

/// 家庭成员数量
@property(nonatomic,copy)  NSString *familyMember;

@property(nonatomic,copy)  NSString *familyMemberCount;

@property(nonatomic,copy)  NSString *isDelete;

/// 房间数量
@property(nonatomic,copy)  NSString *roomNum;

/// 放假名称
@property(nonatomic,copy)  NSString *title;

@property(nonatomic,copy)  NSString *updateTime;

@property(nonatomic,strong)  FamilyIdModel *familyID;

@property(nonatomic,strong)  UserIdModel *userId;

@property(nonatomic,strong)  CustomerModel *customerId;

@end

@interface FamilyIdModel : NSObject

/// 自己的家庭ID
@property(nonatomic,copy)  NSString *familyID;

@property(nonatomic,copy)  NSString *entityType;

@end



NS_ASSUME_NONNULL_END
