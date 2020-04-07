//
//  YFamilyMemberCell.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyMemberCell.h"

@interface YFamilyMemberCell ()

/// 图标
@property(nonatomic,strong) UIImageView * iconImage;

/// 家庭成员名称
@property(nonatomic,strong) UILabel * membersLabel;

/// 称呼
@property(nonatomic,strong) UILabel * callLabel;

@end

@implementation YFamilyMemberCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadFamilyMemberInfoSubView];
    }
    
    return self;
}

#pragma mark -控件
- (void)loadFamilyMemberInfoSubView{
    _iconImage = [[UIImageView alloc]init];
    _iconImage.image = [UIImage imageNamed:@"MyPage_Face_Icon"];
    [self.contentView addSubview:_iconImage];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kRealValue(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(kRealValue(40), kRealValue(40)));
    }];
    
   UIImageView * arrowImage = [[UIImageView alloc]init];
    arrowImage.image = [UIImage imageNamed:@"Common_RightArrow"];
    [self.contentView addSubview:arrowImage];
    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-kRealValue(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(kRealValue(9), kRealValue(15)));
    }];
    
    _callLabel = [[UILabel alloc]init];
    _callLabel.text = @"";
    _callLabel.font = [UIFont systemFontOfSize:15];
    _callLabel.textAlignment = NSTextAlignmentRight;
    _callLabel.textColor = [[YColorManger shareYColorManger] get333333Color];
    [self.contentView addSubview:_callLabel];
    [_callLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(arrowImage.mas_left).offset(-kRealValue(15));
        make.height.equalTo(@(kRealValue(20)));
        make.width.equalTo(@(kRealValue(60)));
    }];
    
    _membersLabel = [[UILabel alloc]init];
    _membersLabel.text = @"";
    _membersLabel.font = [UIFont systemFontOfSize:15];
    _membersLabel.textAlignment = NSTextAlignmentLeft;
    _membersLabel.textColor = [[YColorManger shareYColorManger] get333333Color];
    [self.contentView addSubview:_membersLabel];
    [_membersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.iconImage.mas_right).offset(kRealValue(15));
        make.height.equalTo(@(kRealValue(20)));
        make.right.equalTo(self.callLabel.mas_left).offset(-kRealValue(15));
    }];
    
    UIView * lineView = [[UIView alloc]init];
    lineView.backgroundColor = [[YColorManger shareYColorManger] getecececColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kRealValue(15));
        make.right.equalTo(self.contentView.mas_right).offset(-kRealValue(15));
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@kRealValue(0.5));
    }];
}

- (void)setMenberModel:(TuyaSmartHomeMemberModel *)menberModel {
    _menberModel = menberModel;
    if (menberModel.role == TYHomeRoleType_Owner || menberModel.role == TYHomeRoleType_Admin) {
        _callLabel.text = @"管理员";
    }else{
        _callLabel.text = @"成员";
    }
    
    _membersLabel.text = menberModel.name;
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
