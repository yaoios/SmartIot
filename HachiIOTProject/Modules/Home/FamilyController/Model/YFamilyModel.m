//
//  YFamilyModel.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/3.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyModel.h"

@implementation YFamilyModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"familyID":@"id"
             };
}

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"userId" : [UserIdModel class],
             @"familyID":[FamilyIdModel class]
    };
}

@end

@implementation FamilyIdModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"familyID":@"id"
             };
}

@end
