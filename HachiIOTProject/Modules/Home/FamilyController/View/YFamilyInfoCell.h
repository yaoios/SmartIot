//
//  YFamilyInfoCell.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFamilyInfoCell : UITableViewCell

/// 家庭成员信息
@property(nonatomic,strong) TuyaSmartHomeMemberModel * menberModel;

/// 家庭名称
@property(nonatomic,copy)  NSString *nameValue;

/// 称呼
@property(nonatomic,copy)  NSString *callValue;

/// 位置
@property(nonatomic,copy)  NSString *locationValue;

/// 创建房间和设备view
- (void)setRoomAndDeviceSubView;

@property(nonatomic,copy)  void (^familyInfoAddDevice)(void);

@end

NS_ASSUME_NONNULL_END
