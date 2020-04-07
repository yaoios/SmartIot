//
//  HtjfColorConfig.h
//  HtjfApp
//
//  Created by 杜昂宸 on 16/8/22.
//  Copyright © 2016年 张书源. All rights reserved.
//
#import <UIKit/UIKit.h>

#define Htjf_Network_tip  @"网络异常，请稍后尝试！"

#define Htjf_Connect_Failure  @"系统繁忙，操作失败"

#define AppDelegateInstance                 ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define WidthScale  [UIScreen mainScreen].bounds.size.width/375.0

#define AutomaticW(number) (number * WidthScale)

#define kRealValue(with) ((with)*(WidthScale))


//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

// 判断iPhone11
#define IS_IPHONE_11 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

// 判断iPhone11Pro
#define IS_IPHONE_11_Pro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

// 判断iPhone11Pro_Max
#define IS_IPHONE_11_Pro_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

// 状态栏高度
#define Height_StatusBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES || IS_IPHONE_11 == YES || IS_IPHONE_11_Pro == YES || IS_IPHONE_11_Pro_Max == YES) ? 44.0 : 20.0)

// 导航栏高度
#define Height_NavBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES || IS_IPHONE_11 == YES || IS_IPHONE_11_Pro == YES || IS_IPHONE_11_Pro_Max == YES) ? 88.0 : 64.0)

// tabBar高度
#define Height_TabBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES || IS_IPHONE_11 == YES || IS_IPHONE_11_Pro == YES || IS_IPHONE_11_Pro_Max == YES) ? 83.0 : 49.0)

// home indicator
#define Height_HOME_INDICATOR ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES || IS_IPHONE_11 == YES || IS_IPHONE_11_Pro == YES || IS_IPHONE_11_Pro_Max == YES) ? 34.0 : 0)

//判断iPhoneX所有系列
#define IS_PhoneXAll (IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs_Max || IS_IPHONE_Xs || IS_IPHONE_11 || IS_IPHONE_11_Pro || IS_IPHONE_11_Pro_Max)

#define  FontSize(sizefont)  [UIFont systemFontOfSize:sizefont+sizeValue([UIScreen mainScreen].bounds.size.height)]
#define  FontNameSize(sizefont)  [UIFont fontWithName:@"Helvetica" size:sizefont+sizeValue([UIScreen mainScreen].bounds.size.height)]
//加粗
#define  FontNameSizeBold(sizefont)  [UIFont fontWithName:@"Helvetica-Bold" size:sizefont+sizeValue([UIScreen mainScreen].bounds.size.height)]
//变细
#define  FontNameSizeThin(sizefont)  [UIFont systemFontOfSize:sizefont+sizeValue([UIScreen mainScreen].bounds.size.height) weight:UIFontWeightThin]

#define  FontBoldSize(sizefont)  [UIFont boldSystemFontOfSize:sizefont+sizeValue([UIScreen mainScreen].bounds.size.height)]
#define IOS_VERSION_9_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)? (YES):(NO))

#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] <= 8.0)? (YES):(NO))

//系统颜色
#define CLEARCOLOR [UIColor clearColor]
#define REDCOLOR [UIColor redColor]
#define BLACKCOLOR [UIColor blackColor]
#define DARKGRAYCOLOR [UIColor darkGrayColor]
#define LIGHTGRAYCOLOR [UIColor lightGrayColor]
#define WHITECOLOR [UIColor whiteColor]
#define GRAYCOLOR [UIColor grayColor]
#define GREENCOLOR [UIColor greenColor]
#define BLUECOLOR [UIColor blueColor]
#define CYANCOLOR [UIColor cyanColor]
#define YELLOWCOLOR [UIColor yellowColor]
#define MAGENTACOLOR [UIColor magentaColor]
#define ORANGECOLOR [UIColor orangeColor]
#define PURPLECOLOR [UIColor purpleColor]
#define BROWNCOLOR [UIColor brownColor]
#define DNColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

//4
static inline int sizeValue(float thing) {
    if(thing<500)
    {
        if(IOS_VERSION_9_OR_ABOVE)
            return  -1;
        return 0;
    }
    else if (thing<600)
    {
        if(IOS_VERSION_9_OR_ABOVE)
            return  -1;
        return 0;
    }
    else if (thing<700)
    {
        if(IOS_VERSION_9_OR_ABOVE)
            return  1;
        return 2;
    }
    else if (thing<800)
    {
        if(IOS_VERSION_9_OR_ABOVE)
            return  2;
        return 3;
    }else
    {
        if(IOS_VERSION_9_OR_ABOVE)
            return  -1;
        return 0;
    }
}
#pragma mark 非加粗
#define   TextSize10    [UIFont  systemFontOfSize:10]
#define   TextSize11    [UIFont  systemFontOfSize:11]
#define   TextSize12    [UIFont  systemFontOfSize:12]
#define   TextSize13    [UIFont  systemFontOfSize:13]
#define   TextSize14    [UIFont  systemFontOfSize:14]
#define   TextSize15    [UIFont  systemFontOfSize:15]
#define   TextSize16    [UIFont  systemFontOfSize:16]
#define   TextSize17    [UIFont  systemFontOfSize:17]
#define   TextSize18    [UIFont  systemFontOfSize:18]
#define   TextSize19    [UIFont  systemFontOfSize:19]
#define   TextSize20    [UIFont  systemFontOfSize:20]
#define   TextSize21    [UIFont  systemFontOfSize:21]
#define   TextSize22    [UIFont  systemFontOfSize:22]
#define   TextSize23    [UIFont  systemFontOfSize:23]
#define   TextSize24    [UIFont  systemFontOfSize:24]
#define   TextSize25    [UIFont  systemFontOfSize:25]
#define   TextSize26    [UIFont  systemFontOfSize:26]
#define   TextSize27    [UIFont  systemFontOfSize:27]
#define   TextSize28    [UIFont  systemFontOfSize:28]
#define   TextSize30    [UIFont  systemFontOfSize:30]
#define   TextSize45    [UIFont  systemFontOfSize:45]

#pragma mark 加粗字体
#define   TextSize10_B    [UIFont  boldSystemFontOfSize:10]
#define   TextSize11_B    [UIFont  boldSystemFontOfSize:11]
#define   TextSize12_B    [UIFont  boldSystemFontOfSize:12]
#define   TextSize13_B    [UIFont  boldSystemFontOfSize:13]
#define   TextSize14_B    [UIFont  boldSystemFontOfSize:14]
#define   TextSize15_B    [UIFont  boldSystemFontOfSize:15]
#define   TextSize16_B    [UIFont  boldSystemFontOfSize:16]
#define   TextSize17_B    [UIFont  boldSystemFontOfSize:17]
#define   TextSize18_B    [UIFont  boldSystemFontOfSize:18]
#define   TextSize19_B    [UIFont  boldSystemFontOfSize:19]
#define   TextSize20_B    [UIFont  boldSystemFontOfSize:20]
#define   TextSize21_B    [UIFont  boldSystemFontOfSize:21]
#define   TextSize22_B    [UIFont  boldSystemFontOfSize:22]
#define   TextSize23_B    [UIFont  boldSystemFontOfSize:23]
#define   TextSize24_B    [UIFont  boldSystemFontOfSize:24]
#define   TextSize25_B    [UIFont  boldSystemFontOfSize:25]
#define   TextSize26_B    [UIFont  boldSystemFontOfSize:26]
#define   TextSize27_B    [UIFont  boldSystemFontOfSize:27]
#define   TextSize28_B    [UIFont  boldSystemFontOfSize:28]



#pragma mark - 相册选取使用
#define ScreenSize [UIScreen mainScreen].bounds.size
#define kThumbnailLength    ([UIScreen mainScreen].bounds.size.width - 5*5)/4
#define kThumbnailSize      CGSizeMake(kThumbnailLength, kThumbnailLength)
#define DistanceFromTopGuiden(view) (view.frame.origin.y + view.frame.size.height)
#define DistanceFromLeftGuiden(view) (view.frame.origin.x + view.frame.size.width)
#define ViewOrigin(view)   (view.frame.origin)
#define ViewSize(view)  (view.frame.size)

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self; //弱引用
