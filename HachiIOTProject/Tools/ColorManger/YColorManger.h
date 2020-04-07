//
//  YColorManger.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YColorManger : NSObject

+(instancetype)shareYColorManger;

/// 白色
- (UIColor *)getFFFFFFColor;

/// 项目背景色
- (UIColor *)getf8f8f8Color;

/// 项目红色
- (UIColor *)getdf2d1fColor;

/// 分割线
- (UIColor *)getecececColor;

/// 黑色
- (UIColor *)getBlackColor;

- (UIColor *)getd8d8d8Color;

/// 灰色 按钮不可点击
- (UIColor *)get505050Color;

- (UIColor *)get909090Color;

- (UIColor *)get808080Color;

- (UIColor *)getc5c5c5Color;

- (UIColor *)get555555Color;

- (UIColor *)getb2b2b2Color;

- (UIColor *)get606060Color;

- (UIColor *)get333333Color;

@end

NS_ASSUME_NONNULL_END
