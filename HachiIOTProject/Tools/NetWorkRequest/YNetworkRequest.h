//
//  YNetworkRequest.h
//  YIOTDemo
//
//  Created by xuguangyao on 2020/3/25.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YNetworkRequest : NSObject

/// POST请求
/// @param urlString 请求地址
/// @param par 请求参数
/// @param result 成功回调
/// @param err 错误回调
+(void)postWithURLString:(NSString *)urlString parameters:(NSDictionary *)par success:(void (^) (NSDictionary*dic))result error:(void(^)(NSError *err))err;

/// POST表单请求（不是json）
/// @param urlString 请求地址
/// @param par 请求参数
/// @param result 成功回调
/// @param err 错误回调
+(void)postFormWithURLString:(NSString *)urlString parameters:(NSDictionary *)par success:(void (^) (NSDictionary*dic))result error:(void(^)(NSError *err))err;

/// GET请求
/// @param urlString 请求地址
/// @param par 请求参数
/// @param result 成功回调
/// @param err 错误回调
+(void)getWithURLString:(NSString *)urlString parameters:(NSDictionary *)par success:(void (^) (NSDictionary*dic))result error:(void(^)(NSError *err))err;

@end

NS_ASSUME_NONNULL_END
