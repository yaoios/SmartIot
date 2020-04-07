//
//  YRoomCollectionView.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/3.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YRoomCollectionView : UICollectionView

/// 添加房间和设备点击事件
@property(nonatomic,copy)  void(^addDeviceAndRoomEnvent)(void);

@end

NS_ASSUME_NONNULL_END
