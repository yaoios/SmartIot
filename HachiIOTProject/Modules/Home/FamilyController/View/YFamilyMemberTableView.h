//
//  YFamilyMemberTableView.h
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFamilyMemberTableView : UITableView

/// 数据
@property(nonatomic,strong) NSMutableArray<TuyaSmartHomeMemberModel *> * memberDataArray;

/// 成员点击事件
@property(nonatomic,copy)  void (^clickFamilyMemberInfoRow)(TuyaSmartHomeMemberModel *model);

/// 添加成员
@property(nonatomic,copy)  void (^addFamilyMember)(void);

@end

NS_ASSUME_NONNULL_END
