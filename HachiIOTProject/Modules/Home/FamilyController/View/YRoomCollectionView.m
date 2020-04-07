//
//  YRoomCollectionView.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/3.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YRoomCollectionView.h"
#import "YRoomAndDeviceItem.h"
@interface YRoomCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

static NSString * YRoomAndDeviceItemID = @"YRoomAndDeviceItem";

@implementation YRoomCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self loadRoomCollectionView];
        
    }
    return self;
}

- (void)loadRoomCollectionView {
   
    [self registerClass:[YRoomAndDeviceItem class] forCellWithReuseIdentifier:YRoomAndDeviceItemID];
    self.delegate = self;
    self.dataSource = self;
    
}

#pragma mark - ---点击事件----
- (void)addDeviceEnvent {
    self.addDeviceAndRoomEnvent();
}
#pragma mark - 代理

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YRoomAndDeviceItem * cell = [collectionView dequeueReusableCellWithReuseIdentifier:YRoomAndDeviceItemID forIndexPath:indexPath];
    if (indexPath.item == 9) {
        WS(weakSelf);
        [cell setlastSubViewAddBtn];
        cell.addDeviceWithRoom = ^{
            [weakSelf addDeviceEnvent];
        };
    }
    return cell;
}
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
