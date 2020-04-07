//
//  Help.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "Help.h"
#import "WBSVProgressHUDManager.h"
#import "MBProgressHUD+WBAddtional.h"
#import "AppDelegate.h"
@implementation Help

#pragma mark - 富文本文字大小修改
+(NSMutableAttributedString *)changeLabelTextWithString:(NSString *)string Font:(UIFont *)font color:(UIColor *)color location:(NSInteger)location lenth:(NSInteger)lenth {
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attStr addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color} range:NSMakeRange(location, lenth)];
    
    return attStr;
}

#pragma mark - 高斯模糊
+(UIVisualEffectView *)addEffectViewWithFrame:(CGRect)frame Type:(UIBlurEffectStyle)type{
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:type];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    
    effectView.frame = frame;
    
    return effectView;
}

#pragma mark - 截取图片的某一部分
+(UIImage *)cutIamgeFromImage:(UIImage *)image inRect:(CGRect)rect{
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    CGImageRelease(newImageRef);
    return newImage;
}

+(UIViewController*)viewController:(UIView*)localView {
    for (UIView* next = [[localView superview] superview]; next; next =
            next.superview) {
           UIResponder* nextResponder = [next nextResponder];
           if ([nextResponder isKindOfClass:[UIViewController
                                             class]]) {
               return (UIViewController*)nextResponder;
           }
       }
       return nil;
}

+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
           
           return nil;
           
       }
       
       NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
       
       NSError *err;
       
       NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                            
                                                           options:NSJSONReadingMutableContainers
                            
                                                             error:&err];
       
       if(err) {
           
           NSLog(@"json解析失败：%@",err);
           
           return nil;
           
       }
       
       return dic;
}

/// 字典转json
/// @param dictionary json
+ (NSString *)dictionaryToJSONString:(NSDictionary *)dictionary {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
    return jsonResult;
}

/// 数组转json
/// @param array json
+ (NSString *)arrayToJSONString:(NSArray *)array {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
    //    NSLog(@"json array is: %@", jsonResult);
    return jsonResult;
}

/// 对象转json
/// @param object json
+ (NSString*)ObjectTojsonString:(id)object {
    NSString *jsonString = [[NSString
                             
                             alloc]init];
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization
                        
                        dataWithJSONObject:object
                        
                        options:NSJSONWritingPrettyPrinted
                        
                        error:&error];
    
    if (! jsonData) {
        
        NSLog(@"error: %@", error);
        
    } else {
        
        jsonString = [[NSString
                       
                       alloc] initWithData:jsonData
                      
                      encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString
                               
                               stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    [mutStr replaceOccurrencesOfString:@" "
     
                            withString:@""
     
                               options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\n"
     
                            withString:@""
     
                               options:NSLiteralSearch range:range2];
    NSRange range3 = {0, mutStr.length};
    NSString * str = @"\\";
    [mutStr replaceOccurrencesOfString:str withString:@"" options:NSLiteralSearch range:range3];
    
    return mutStr;
}

+(BOOL)isOnlyContainAllowCharacterWithStr:(NSString *)string {
    NSInteger len = string.length;
    for(int i=0;i<len;i++)
    {
        NSLog(@"");
        unichar a=[string characterAtIndex:i];
        if(!((isalpha(a))
             ||(isalnum(a))
             ||((a=='_'))
             ||((a=='-'))||([string isEqualToString:@"➋"]||[string isEqualToString:@"➌"]||[string isEqualToString:@"➍"]||[string isEqualToString:@"➎"]||[string isEqualToString:@"➏"]||[string isEqualToString:@"➐"]||[string isEqualToString:@"➑"]||[string isEqualToString:@"➒"] )
             ||((a >= 0x4e00 && a <= 0x9fa6))
             ))
            
            
            return YES;
    }
    return NO;
}

+ (BOOL)isContainsTwoEmoji:(NSString *)string {
    __block BOOL isEomji = NO;
       [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
        ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
            const unichar hs = [substring characterAtIndex:0];
            //         NSLog(@"hs++++++++%04x",hs);
            if (0xd800 <= hs && hs <= 0xdbff) {
                if (substring.length > 1) {
                    const unichar ls = [substring characterAtIndex:1];
                    const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f)
                    {
                        isEomji = YES;
                    }
                    //                 NSLog(@"uc++++++++%04x",uc);
                }
            } else if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3|| ls ==0xfe0f) {
                    isEomji = YES;
                }
                //             NSLog(@"ls++++++++%04x",ls);
            } else {
                if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                    isEomji = YES;
                } else if (0x2B05 <= hs && hs <= 0x2b07) {
                    isEomji = YES;
                } else if (0x2934 <= hs && hs <= 0x2935) {
                    isEomji = YES;
                } else if (0x3297 <= hs && hs <= 0x3299) {
                    isEomji = YES;
                } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                    isEomji = YES;
                }
            }
            
        }];
       return isEomji;
}

+ (BOOL)hasEmoji:(NSString*)string {
    NSString *pattern = @"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:string];
    return isMatch;
}

+(BOOL)isNineKeyBoard:(NSString *)string {
    NSString *other = @"➋➌➍➎➏➐➑➒";
    int len = (int)string.length;
    for(int i=0;i<len;i++)
    {
        if(!([other rangeOfString:string].location != NSNotFound))
            return NO;
    }
    return YES;
}

/**
 * 判断字符串包含中文
 *
 */
+ (BOOL)includeChinese:(NSString*)string {
    for(int i=0; i< [string length];i++)
       {
           int a =[string characterAtIndex:i];
           if( a >0x4e00&& a <0x9fff){
               return YES;
           }
       }
       return NO;
}

/**
 * 判断字符串包含ip
 *
 */
+ (BOOL)isValidatIP:(NSString *)ipAddress {
    NSString  *urlRegEx =@"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
       "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
       "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
       "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
       
       NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
       return [urlTest evaluateWithObject:ipAddress];
}


+(BOOL) isNetworkEnabled
{
    BOOL bEnabled = FALSE;
    NSString *url = @"www.baidu.com";
    SCNetworkReachabilityRef ref = SCNetworkReachabilityCreateWithName(NULL, [url UTF8String]);
    SCNetworkReachabilityFlags flags;
    
    bEnabled = SCNetworkReachabilityGetFlags(ref, &flags);
    
    CFRelease(ref);
    if (bEnabled) {
        BOOL flagsReachable = ((flags & kSCNetworkFlagsReachable) != 0);
        BOOL connectionRequired = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
        BOOL nonWiFi = flags & kSCNetworkReachabilityFlagsTransientConnection;
        bEnabled = ((flagsReachable && !connectionRequired) || nonWiFi) ? YES : NO;
    }
    
    return bEnabled;
}

/// 显示hud
+(void)simpleHudShow {
    [MBProgressHUD wb_showActivity];
    
}

/// 成功提示
/// @param message 成功信息
+(void)showSuccessMessage:(NSString *)message {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD wb_showSuccess:message];
    });
    
}

/// 错误提示
/// @param message 错误信息
+(void)showErrorMessage:(NSString *)message {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD wb_showError:message];
    });
    
}

+(void)showMessage:(NSString *)message {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD wb_showMessage:message];
    });
}

/// 隐藏hud
+(void)simpleHudHide {

    [MBProgressHUD wb_hideHUD];
}

@end
