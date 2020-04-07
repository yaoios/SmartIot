//
//  NSString+UUID.h
//  Encapsulation
//
//  Created by zhao on 2016/11/23.
//  Copyright © 2016年 zhaoName. All rights reserved.
//  获取UUID并存储到keyChain

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (UUID)

/**
 获取openID

 @return openID
 */
+ (NSString *)getUUID;

@end



@interface KeyChainStore : NSObject

// 将UUID保存到钥匙串
+ (void)save:(NSString *)service data:(id)data;
// 读取保存到钥匙串的UUID
+ (id)load:(NSString *)service;
// 删除保存到钥匙串的UUID
+ (void)deleteKeyData:(NSString *)service;

@end
