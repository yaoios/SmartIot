//
//  BaseNavigationController.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavigationController : UINavigationController

/// 隐藏导航底部横线
/// @param isShould 是YES，否No
-(void)isShowShadowLine:(BOOL)isShould;

/// 隐藏导航背景
/// @param isShould 是YES，否No
-(void)isShowShadowImg:(BOOL)isShould;

@end

NS_ASSUME_NONNULL_END
