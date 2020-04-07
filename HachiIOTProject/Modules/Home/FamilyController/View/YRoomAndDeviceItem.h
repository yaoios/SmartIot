//
//  YRoomAndDeviceItem.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/3.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YRoomAndDeviceItem : UICollectionViewCell

/// 最后为添加设备
- (void)setlastSubViewAddBtn;

@property(nonatomic,copy)  void(^addDeviceWithRoom)(void);

@end

NS_ASSUME_NONNULL_END
