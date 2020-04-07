//
//  YFamilyVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/2.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YFamilyVC.h"
#import "YFamilyTableView.h"
#import "YFamilyInfoVC.h"
#import "YFamilyModel.h"
@interface YFamilyVC ()

@property(nonatomic,strong) YFamilyTableView * tableView;

/// 记录请求页数 默认1
@property(nonatomic,assign) NSInteger pageSize;

/// 数据
@property(nonatomic,strong) NSMutableArray * familyArray;


@end

@implementation YFamilyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"家庭管理";
    [self setUpFamilySubView];
    _pageSize = 1;
    [self requestFamilyData];
}

#pragma mark - --- 控件 ---
- (void)setUpFamilySubView {
    _tableView = [[YFamilyTableView alloc] init];
    WS(weakSelf);
    _tableView.clickFamilyRow = ^(YFamilyModel * _Nonnull model) {
        [weakSelf clickFamliyEnvent:model];
    };
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
   
    //上拉加载
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        weakSelf.pageSize++;
        [weakSelf requestFamilyData];
    }];
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.pageSize = 1;
        [weakSelf requestFamilyData];
    }];
}

#pragma mark - --- 代理 ---

#pragma mark - --- 点击事件 --
- (void)clickFamliyEnvent:(YFamilyModel *)dataModel {
    
    YFamilyInfoVC * infoVC = [[YFamilyInfoVC alloc] init];
    infoVC.model = dataModel;
    [self.navigationController pushViewController:infoVC animated:YES];
    [IOTRequestManger shareIOTRequestManger].familyModel = dataModel;
}

#pragma mark - --- 数据处理 --
- (void)requestFamilyData {

    [self simpleHudShow];
    //如果pagesize为1的话，默认初始化
    if (_pageSize == 1) {
        if (self.familyArray.count > 0) {
            [self.familyArray removeAllObjects];
        }
    }
    NSDictionary * parmeters = @{@"currentPage":@(_pageSize),
                                 @"pageSize":@(10),
                                 @"textSearch":@""
    };
    WS(weakSelf);
    if (self.tableView.mj_footer.isRefreshing) {
        [self.tableView.mj_footer endRefreshing];
    }
    if (self.tableView.mj_header.isRefreshing) {
        [self.tableView.mj_header endRefreshing];
    }
    
    [YNetworkRequest getWithURLString:SmartIOTHomeList parameters:parmeters success:^(NSDictionary * _Nonnull dic) {
        [weakSelf simpleHudHide];
        if ([dic[@"code"] integerValue] == 1000){
            NSDictionary * dicData = [dic objectForKey:@"data"];
            NSArray * dataArr = [dicData objectForKey:@"data"];
            if (dataArr.count > 0) {
                for (NSDictionary * familyDic in dataArr) {
                    YFamilyModel * model = [YFamilyModel yy_modelWithDictionary:familyDic];
                    [weakSelf.familyArray addObject:model];
                }
            }
            if (weakSelf.familyArray.count > 0) {
                weakSelf.tableView.dataArray = weakSelf.familyArray;
            }
              
        }else{
                 
            [Help showErrorMessage:[dic objectForKey:@"message"]];
              
        }
    } error:^(NSError * _Nonnull err) {
        [weakSelf simpleHudHide];
        [Help showErrorMessage:Htjf_Connect_Failure];
    }];
       
}
#pragma mark - --- 其它 --

- (NSMutableArray *)familyArray {
    if (_familyArray == nil) {
        _familyArray = [NSMutableArray array];
    }
    return _familyArray;
}

- (void)dealloc {
    NSLog(@"销毁了");
}

@end
