//
//  YFamilyCell.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyCell.h"

@interface YFamilyCell ()

/// 箭头图标
@property(nonatomic,strong) UIImageView * arrowImage;

/// 家庭名称
@property(nonatomic,strong) UILabel * familyNameLabel;


/// 房间名称
@property(nonatomic,strong) UILabel * roomAndDeviceLabel;

@end

@implementation YFamilyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadFamilySubView];
    }
    
    return self;
}

#pragma mark -控件
- (void)loadFamilySubView {
    
    _arrowImage = [[UIImageView alloc]init];
    _arrowImage.image = [UIImage imageNamed:@"Common_RightArrow"];
    [self.contentView addSubview:_arrowImage];
    [_arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kRealValue(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(kRealValue(9), kRealValue(15)));
    }];
    
    _familyNameLabel = [[UILabel alloc]init];
    _familyNameLabel.text = @"";
    _familyNameLabel.font = [UIFont systemFontOfSize:15];
    _familyNameLabel.textAlignment = NSTextAlignmentLeft;
    _familyNameLabel.textColor = [[YColorManger shareYColorManger] get333333Color];
    [self.contentView addSubview:_familyNameLabel];
    
    _roomAndDeviceLabel = [[UILabel alloc]init];
    _roomAndDeviceLabel.textColor = [[YColorManger shareYColorManger] get808080Color];
    _roomAndDeviceLabel.text = @"";
    _roomAndDeviceLabel.textAlignment = NSTextAlignmentLeft;
    _roomAndDeviceLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_roomAndDeviceLabel];
    
    UIView * lineView = [[UIView alloc]init];
    lineView.backgroundColor = [[YColorManger shareYColorManger] getecececColor];
    [self.contentView addSubview:lineView];
    
    [_familyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(kRealValue(12));
        make.left.equalTo(self.contentView.mas_left).offset(kRealValue(10));
        make.height.equalTo(@(kRealValue(20)));
        make.right.equalTo(self.arrowImage.mas_left).offset(-kRealValue(5));
    }];
    
    [_roomAndDeviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.familyNameLabel.mas_bottom).offset(kRealValue(2));
        make.left.equalTo(self.familyNameLabel.mas_left);
        make.height.equalTo(@kRealValue(17));
        make.right.equalTo(self.arrowImage.mas_left).offset(-kRealValue(5));
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kRealValue(15));
        make.right.equalTo(self.contentView.mas_right).offset(-kRealValue(15));
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@kRealValue(0.5));
    }];
}

- (void)setModel:(YFamilyModel *)model {
    _model = model;
    _familyNameLabel.text = model.title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
