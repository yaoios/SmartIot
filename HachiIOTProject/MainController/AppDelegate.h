//
//  AppDelegate.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabbarVC.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainTabbarVC *tabbarVC;

/// @param animation 添加导航控制器
- (void)addMainTabBarController:(BOOL)animation;

@end

