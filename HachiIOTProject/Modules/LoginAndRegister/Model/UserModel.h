//
//  UserModel.h
//  HachiSmartIOT
//
//  Created by xuguangyao on 2020/3/26.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UserInfo ,UserIdModel,TenantModel,CustomerModel;

@interface UserModel : NSObject

hc_singleton_h(UserModel);

@property(nonatomic,copy)  NSString *refreshToken;

@property(nonatomic,copy)  NSString *token;

@property(nonatomic,strong) UserInfo * user;


@end

@interface UserInfo : NSObject

@property(nonatomic,copy)  NSString *additionalInfo;

@property(nonatomic,copy)  NSString *authority;

@property(nonatomic,copy)  NSString *createdTime;

@property(nonatomic,strong)  CustomerModel *customerId;

@property(nonatomic,copy)  NSString *email;

@property(nonatomic,copy)  NSString *firstName;

@property(nonatomic,copy)  NSString *isForbidden;

@property(nonatomic,copy)  NSString *lastName;

@property(nonatomic,copy)  NSString *mobile;

@property(nonatomic,copy)  NSString *name;

@property(nonatomic,copy)  NSString *tuyaAccount;

@property(nonatomic,strong)  TenantModel *tenantId;

@property(nonatomic,strong)  UserIdModel *idValue;

@end

@class UserInfo;

@interface CustomerModel : NSObject

@property(nonatomic,copy)  NSString * entityType;

@property(nonatomic,copy)  NSString * idValue;

@end

@interface UserIdModel : NSObject

@property(nonatomic,copy)  NSString * entityType;

@property(nonatomic,copy)  NSString * idValue;

@end

@interface TenantModel : NSObject

@property(nonatomic,copy)  NSString * entityType;

@property(nonatomic,copy)  NSString * idValue;

@end
NS_ASSUME_NONNULL_END
