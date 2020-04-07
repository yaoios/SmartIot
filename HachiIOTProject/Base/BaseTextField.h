//
//  BaseTextField.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTextField : UITextField

/// 限制输入字数（如果有限制的话，记得要移除通知）
@property(nonatomic,assign)  NSInteger maxValue;

/// 移除通知
- (void)removeTextDidChangeNotification;

@end

NS_ASSUME_NONNULL_END
