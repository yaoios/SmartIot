//
//  MMyPageCell.h
//  hachiSmartHome
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMyPageModel.h"


@interface MMyPageCell : UITableViewCell

@property (nonatomic, strong) MMyPageModel *cellModel;

@property (nonatomic, strong) UILabel *rightLab;//右侧文字

@end
