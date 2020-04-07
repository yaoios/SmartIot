//
//  YRoomVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YRoomVC.h"

@interface YRoomVC ()

@end

@implementation YRoomVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"房间";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestRoomList];
}

#pragma mark - --- 控件 ---


#pragma mark - --- 代理 ---

#pragma mark - --- 点击事件 --

#pragma mark - --- 数据处理 --
- (void)requestRoomList {
    NSMutableDictionary * paremters = [NSMutableDictionary dictionary];
    [paremters setValue:[IOTRequestManger shareIOTRequestManger].familyModel.familyID.familyID forKey:@"familyIdStr"];
    [YNetworkRequest getWithURLString:SmartIOTRoomList parameters:paremters success:^(NSDictionary * _Nonnull dic) {
        if ([dic[@"code"] integerValue] == 1000) {
            
        }
    } error:^(NSError * _Nonnull err) {
        
    }];
}

#pragma mark - --- 其它 --

@end
