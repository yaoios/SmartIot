//
//  MMyPageCell.m
//  hachiSmartHome
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "MMyPageCell.h"

@interface MMyPageCell ()

@property (nonatomic, strong) UIImageView *iconImgView;//左侧img

@property (nonatomic, strong) UILabel *titleLab;//上部title

@property (nonatomic, strong) UILabel *subTitleLab;//下部title

@property (nonatomic, strong) UIImageView *assistImgView;//辅助图标

@end

@implementation MMyPageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadSubviews];
    }
    return self;
}

-(void)loadSubviews{
    _iconImgView = [[UIImageView alloc] init];
    _iconImgView.layer.cornerRadius = kRealValue(20);
    [self.contentView addSubview:_iconImgView];
    
    _titleLab = [[UILabel alloc] init];
    _titleLab.textColor = [[YColorManger shareYColorManger] get555555Color];
    _titleLab.font = FontSize(14);
    _titleLab.text = @"";
    [self.contentView addSubview:_titleLab];
    
    _subTitleLab = [[UILabel alloc] init];
    _subTitleLab.textColor = [[YColorManger shareYColorManger] getb2b2b2Color];
    _subTitleLab.font = FontSize(12);
    _subTitleLab.text = @"";
    [self.contentView addSubview:_subTitleLab];
    
    _assistImgView = [[UIImageView alloc] init];
    _assistImgView.image = [UIImage imageNamed:@"Common_RightArrow"];
    [self.contentView addSubview:_assistImgView];
    
    _rightLab = [[UILabel alloc] init];
    _rightLab.text = @"";
    _rightLab.font = FontSize(12);
    _rightLab.textColor = [[YColorManger shareYColorManger] get555555Color];
    _rightLab.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_rightLab];
    
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [[YColorManger shareYColorManger] getecececColor];
    [self.contentView addSubview:bottomLine];
    
    [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@(kRealValue(40)));
        make.width.equalTo(@(kRealValue(40)));
    }];
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImgView);
        make.left.equalTo(_iconImgView.mas_right).offset(10);
        make.height.equalTo(_iconImgView).multipliedBy(0.5);
        make.width.equalTo(@(100));
    }];
    
    [_subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLab.mas_left);
        make.top.equalTo(_titleLab.mas_bottom);
        make.width.equalTo(@(200));
        make.height.equalTo(_iconImgView).multipliedBy(0.5);
    }];
    
    [_assistImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.width.equalTo(@(8));
        make.height.equalTo(@(14));
        make.centerY.equalTo(self.contentView);
    }];
    
    [_rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_assistImgView.mas_left).offset(-10);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImgView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@(0.5));
    }];
}

-(void)setCellModel:(MMyPageModel *)cellModel{
    _cellModel = cellModel;
    
    _titleLab.text = cellModel.titleStr;
    _subTitleLab.text = cellModel.subTitleStr;
//    _rightLab.text = cellModel.rightLebStr;
    _iconImgView.image = [UIImage imageNamed:cellModel.iconStr];
}

@end
