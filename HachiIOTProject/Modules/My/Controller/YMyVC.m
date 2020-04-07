//
//  YMyVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/3/31.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YMyVC.h"
#import "MMyPageCell.h"
#import "MMyPageModel.h"
#import "YFamilyVC.h"
#import "YGatewayNetworkVC.h"
@interface YMyVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

static NSString *MyPageCellID = @"MMyPageCell";

@implementation YMyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    [self initSomeProperty];
    [self setupMyVCSubView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
#pragma mark - --- 控件 ---
- (void)setupMyVCSubView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - Height_HOME_INDICATOR) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
    [_tableView registerClass:[MMyPageCell class] forCellReuseIdentifier:MyPageCellID];
    [self.view addSubview:_tableView];
}

#pragma mark - --- 代理 ---
#pragma mark tableview 代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MMyPageCell *cell = [tableView dequeueReusableCellWithIdentifier:MyPageCellID forIndexPath:indexPath];
    cell.cellModel = [_dataArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kRealValue(70);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                [self pushFmailyVC];
            }
            break;
        case 1:
            {
//                YGatewayNetworkVC * vc = [[YGatewayNetworkVC alloc] init];
//                vc.model = _homeModel;
//                [self.navigationController pushViewController:vc animated:YES];
            }
            
            break;
            case 2:
            {
                YGatewayNetworkVC * vc =[[YGatewayNetworkVC alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
        default:
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - --- 点击事件 --
//跳转家庭管理
- (void)pushFmailyVC {
    YFamilyVC * vc = [[YFamilyVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - --- 数据处理 --
-(void)initSomeProperty{
    _dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<3; i++) {
        MMyPageModel *model = [[MMyPageModel alloc] init];
        switch (i) {
            case 0:
            {
                model.iconStr = @"MyPage_HomeManager_Icon";
                model.titleStr = @"家庭管理";
                model.subTitleStr = @"手机号绑定的网关";
                model.rightLebStr = @"哈奇展厅";
            }
                break;
            case 1:
            {
                model.iconStr = @"MyPage_Setting_Icon";
                model.titleStr = @"设置";
                model.subTitleStr = @"设置界面";
                model.rightLebStr = @"";
            }
                break;
            case 2:
            {
                model.iconStr = @"MyPage_Setting_Icon";
                model.titleStr = @"配网";
                model.subTitleStr = @"网关配网";
                model.rightLebStr = @"";
            }
                break;
            default:
                break;
        }
        [_dataArray addObject:model];
    }
}
#pragma mark - --- 其它 --

@end
