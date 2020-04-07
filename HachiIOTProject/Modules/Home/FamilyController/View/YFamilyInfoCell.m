//
//  YFamilyInfoCell.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyInfoCell.h"
#import "YRoomCollectionView.h"
@interface YFamilyInfoCell ()

/// 家庭成员名称
@property(nonatomic,strong) UILabel * nameLabel;

/// 称呼
@property(nonatomic,strong) UILabel * callLabel;

@end

@implementation YFamilyInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadFamilyInfoSubView];
    }
    
    return self;
}

#pragma mark -控件
- (void)loadFamilyInfoSubView{
    
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
  
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.text = @"";
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.textColor = [[YColorManger shareYColorManger] getBlackColor];
    [self.contentView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(kRealValue(15));
        make.height.equalTo(@(kRealValue(20)));
        make.width.equalTo(@(kRealValue(80)));
    }];
    
    [_callLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerY.equalTo(self.contentView);
          make.right.equalTo(arrowImage.mas_left).offset(-kRealValue(15));
          make.height.equalTo(@(kRealValue(20)));
          make.left.equalTo(self.nameLabel.mas_right).offset(kRealValue(15));
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

//创建房间和设备view
- (void)setRoomAndDeviceSubView {
    
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    YRoomCollectionView * collectionView = [[YRoomCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [[YColorManger shareYColorManger] getFFFFFFColor];
    [self.contentView addSubview:collectionView];
    WS(weakSelf);
    collectionView.addDeviceAndRoomEnvent = ^{
        weakSelf.familyInfoAddDevice();
    };
    CGFloat itemWidth = kScreenWidth / 4;
    layout.itemSize = CGSizeMake(itemWidth, 100);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
    }];
    
}

- (void)setMenberModel:(TuyaSmartHomeMemberModel *)menberModel {
    _menberModel = menberModel;
    
    _nameLabel.text = menberModel.name;
}

- (void)setCallValue:(NSString *)callValue {
    _callValue = callValue;
    _nameLabel.text = @"家庭成员";
    _callLabel.text = callValue;
}

- (void)setNameValue:(NSString *)nameValue {
    _nameValue = nameValue;
    _nameLabel.text = @"家庭名称";
    _callLabel.text = nameValue;
}

- (void)setLocationValue:(NSString *)locationValue {
    _locationValue = locationValue;
    _nameLabel.text = @"家庭位置";
    if (locationValue.length < 1) {
        _callLabel.text = @"未知";
    }else{
       _callLabel.text = locationValue;
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
