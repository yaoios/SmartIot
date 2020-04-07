//
//  BaseViewController.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController


/// 显示hud
-(void)simpleHudShow;

/// 隐藏hud
-(void)simpleHudHide;

/// 导航栏透明
-(void)transparentNavigationBar;

/// 自定义导航栏左侧按钮
/// @param target 目标 也就是调用的本身
/// @param action 点击事件
/// @param imgName 图片名称 注意不能为空
- (void)setUpLeftNavBarIemWithTarget:(id)target action:(SEL)action imageName:(NSString*)imgName;


/// 自定义导航栏图片右侧按钮
/// @param target 目标 也就是调用的本身
/// @param action 点击事件
/// @param imgName 图片名称 注意不能为空
- (void)setUpRightNavBarIemWithTarget:(id)target action:(SEL)action imageName:(NSString*)imgName;


/// 自定义导航栏右侧按钮
/// @param target 目标 也就是调用的本身
/// @param action 点击事件
/// @param title  名称
- (void)setUpRightNavBarIemWithTarget:(id)target action:(SEL)action title:(NSString*)title;

@end

NS_ASSUME_NONNULL_END
