//
//  Help.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Help : NSObject

/// 用于字符串中有大小不相等情况
/// @param string 文本内容
/// @param font 突出部位的字体大小
/// @param color 突出部位的字体颜色
/// @param location 从哪个位置开始
/// @param lenth 突出文字的长度
+(NSMutableAttributedString *)changeLabelTextWithString:(NSString *)string Font:(UIFont *)font color:(UIColor *)color location:(NSInteger)location lenth:(NSInteger)lenth;

/// 添加高斯模糊
/// @param frame 模糊范围
/// @param type 模糊效果
+(UIVisualEffectView *)addEffectViewWithFrame:(CGRect)frame Type:(UIBlurEffectStyle)type;

/// 截取图片的某一部分
/// @param image 截取de图片
/// @param rect 大小
+(UIImage *)cutIamgeFromImage:(UIImage *)image inRect:(CGRect)rect;

/// 击视图时获取所在的控制器
/// @param localView 当前视图
+(UIViewController*)viewController:(UIView*)localView;


/// json格式字符串转字典
/// @param jsonString 返回字典
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/// 字典转json
/// @param dictionary json
+ (NSString *)dictionaryToJSONString:(NSDictionary *)dictionary;

/// 数组转json
/// @param array json
+ (NSString *)arrayToJSONString:(NSArray *)array;

/// 对象转json
/// @param object json
+ (NSString*)ObjectTojsonString:(id)object;


/// 返回是否字符串只包含中文、英文、数字、下划线、中划线
/// @param string 输入字符串
+(BOOL)isOnlyContainAllowCharacterWithStr:(NSString *)string;

/// 判断字符串包含表情
/// @param string 输入字符串
+ (BOOL)isContainsTwoEmoji:(NSString *)string;

/// 判断字符串中是否存在emoji
/// @param string 字符串
+ (BOOL)hasEmoji:(NSString*)string;

/// 判断是不是九宫格
/// @param string 输入的字符
+(BOOL)isNineKeyBoard:(NSString *)string;

/**
 * 判断字符串包含中文
 *
 */
+ (BOOL)includeChinese:(NSString*)string;

/**
 * 判断字符串包含ip
 *
 */
+ (BOOL)isValidatIP:(NSString *)ipAddress;


/// 显示hud
+(void)simpleHudShow;

/// 隐藏hud
+(void)simpleHudHide;

/// 成功提示 带图片
/// @param message 成功信息
+(void)showSuccessMessage:(NSString *)message;

/// 错误提示 带图片
/// @param message 错误信息
+(void)showErrorMessage:(NSString *)message;

/// 谈框提示 不带图片
/// @param message 提示消息
+(void)showMessage:(NSString *)message;

/// 判断当前网络是否可用
+(BOOL)isNetworkEnabled;

@end

NS_ASSUME_NONNULL_END
