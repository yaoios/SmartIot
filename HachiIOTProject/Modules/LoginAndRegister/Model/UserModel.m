//
//  UserModel.m
//  HachiSmartIOT
//
//  Created by xuguangyao on 2020/3/26.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

hc_singleton_m(UserModel);

+(NSDictionary *)modelCustomPropertyMapper {
    return @{@"dicContArrModel":@"dictCont"};
}

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"user" : [UserInfo class]};
}

@end

@implementation UserInfo

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"idValue":@"id"
             };
}

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"idValue" : [UserIdModel class],
             @"tenantId":[TenantModel class],
             @"customerId":[CustomerModel class]
    };
}

@end

@implementation CustomerModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"idValue":@"id"
             };
}
@end

@implementation UserIdModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"idValue":@"id"
             };
}
@end

@implementation TenantModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"idValue":@"id"
             };
}
@end
