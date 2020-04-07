//
//  YRoomAndDeviceItem.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/3.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YRoomAndDeviceItem.h"

@interface YRoomAndDeviceItem ()

/// 房间图标
@property(nonatomic,strong) UIImageView * roomIcon;

/// 房间名称
@property(nonatomic,strong) UILabel * roomLabel;

/// 设备数量
@property(nonatomic,strong) UILabel * deviceCountLabel;


@end

@implementation YRoomAndDeviceItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadRoomItem];
    }
    return self;
}

- (void)loadRoomItem {
    _roomIcon = [[UIImageView alloc]init];
    _roomIcon.image = [UIImage imageNamed:@""];
    _roomIcon.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_roomIcon];
    [_roomIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(kRealValue(5));
        make.size.mas_equalTo(CGSizeMake(kRealValue(40), kRealValue(40)));
    }];
    
    _roomLabel = [[UILabel alloc]init];
    _roomLabel.textColor = [[YColorManger shareYColorManger] get808080Color];
    _roomLabel.text = @"客厅";
    _roomLabel.textAlignment = NSTextAlignmentCenter;
    _roomLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_roomLabel];
    [_roomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.roomIcon.mas_bottom).offset(kRealValue(5));
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@(kRealValue(20)));
    }];
    
    _deviceCountLabel = [[UILabel alloc]init];
    _deviceCountLabel.textColor = [[YColorManger shareYColorManger] get808080Color];
    _deviceCountLabel.text = @"6个设备";
    _deviceCountLabel.textAlignment = NSTextAlignmentCenter;
    _deviceCountLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_deviceCountLabel];
    [_deviceCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.roomLabel.mas_bottom).offset(kRealValue(5));
        make.left.right.equalTo(self.contentView);
    }];
}

- (void)setlastSubViewAddBtn {
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIButton * addDeviceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addDeviceBtn setBackgroundColor:[UIColor blueColor]];
    [addDeviceBtn setTitle:@"添加设备" forState:UIControlStateNormal];
    [addDeviceBtn setTitleColor:[[YColorManger shareYColorManger] get505050Color] forState:UIControlStateNormal];
    addDeviceBtn.titleLabel.font = FontSize(14);
    [addDeviceBtn addTarget:self action:@selector(addDeviceBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:addDeviceBtn];
    [addDeviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(kRealValue(60), kRealValue(60)));
    }];
}

- (void)addDeviceBtn {
    self.addDeviceWithRoom();
}
@end
