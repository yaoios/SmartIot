//
//  YColorManger.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YColorManger.h"
#import <UIColor+YYAdd.h>

@implementation YColorManger

+(instancetype)shareYColorManger {
    static YColorManger * manger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [YColorManger new];
    });
    return manger;
}


- (UIColor *)getFFFFFFColor {
   
    return [self colorWithKey:@"#FFFFFF"];
}

- (UIColor *)getf8f8f8Color {
    
    return [self colorWithKey:@"#f8f8f8"];
}

- (UIColor *)getdf2d1fColor {
    
    return [self colorWithKey:@"#df2d1f"];
}

- (UIColor *)getecececColor {
    
    return [self colorWithKey:@"#ececec"];
}

- (UIColor *)getBlackColor {
    
    return [self colorWithKey:@"#000000"];
}

- (UIColor *)getd8d8d8Color {
    return [self colorWithKey:@"#d8d8d8"];
}

- (UIColor *)get505050Color {
    
    return [self colorWithKey:@"#505050"];
}

- (UIColor *)get909090Color {
    return [self colorWithKey:@"#909090"];
}

- (UIColor *)get808080Color {
    return [self colorWithKey:@"#808080"];
}

- (UIColor *)getc5c5c5Color {
    return [self colorWithKey:@"#c5c5c5"];
}

- (UIColor *)get555555Color {
    return [self colorWithKey:@"#555555"];
}

- (UIColor *)getb2b2b2Color {
    return [self colorWithKey:@"#b2b2b2"];
}

- (UIColor *)get606060Color {
    return [self colorWithKey:@"#606060"];
}

- (UIColor *)get333333Color {
    
    return [self colorWithKey:@"#333333"];
}


#pragma mark --- 后续根据plist文件进行暗黑模式匹配
- (UIColor *)colorWithKey:(NSString *)key {
    
    return [UIColor colorWithHexString:key];
}

@end
