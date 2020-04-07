//
//  YGatewayNetworkVC.m
//  HachiIOTProject
//
//  Created by xuguangyao on 2020/4/3.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YGatewayNetworkVC.h"
#import <CoreLocation/CoreLocation.h>
@interface YGatewayNetworkVC ()<TuyaSmartActivatorDelegate>
{
    NSInteger timeLeft;
    NSInteger timeout;
}
@property (nonatomic, strong) UITextView *console;
@property (nonatomic, strong) UIButton * loginBtn;
@property(nonatomic,strong) UIButton * forgetBtn;
@property(nonatomic,copy)  NSString *tokenValue;
@property(nonatomic,copy)  NSString *devIDValue;
@property(nonatomic,strong) CLLocationManager  * locationManger;
@end

@implementation YGatewayNetworkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"网关配网";
    timeLeft = 100;
    timeout = timeLeft;
    [self initView];
    [self requestToken];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tuyaFindGatewayDevice:) name:TuyaSmartActivatorNotificationFindGatewayDevice object:nil];
    
    _locationManger = [[CLLocationManager alloc]init];
    _locationManger.delegate = self;
    
    NSString * wifiName = [TuyaSmartActivator  currentWifiSSID];
    if (!wifiName) {
        if ([CLLocationManager locationServicesEnabled] ||
            [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
            [_locationManger requestWhenInUseAuthorization];
           }
    }else {
        wifiName =[TuyaSmartActivator  currentWifiSSID];
    }
    
}
#pragma mark --- CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
}
- (void)tuyaFindGatewayDevice:(NSNotification *)sender {
    NSDictionary * dic = sender.object;
    NSLog(@"?????>>>>%@",dic);
}

- (void)clickedLoginBtn {
//    [self countDown];
    [TuyaSmartActivator sharedInstance].delegate = self;
//    [[IOTRequestManger shareIOTRequestManger].activator startConfigWiFiWithToken:_tokenValue timeout:100];
    
    //添加子设备激活
//    [[TuyaSmartActivator sharedInstance] activeSubDeviceWithGwId:_devIDValue timeout:100];
    
    NSLog(@"==%@",[TuyaSmartActivator  currentWifiBSSID]); 
   
}

- (void)activator:(TuyaSmartActivator *)activator didReceiveDevice:(TuyaSmartDeviceModel *)deviceModel error:(NSError *)error {
    
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(countDown) object:nil];
//    timeout = timeLeft;
    NSString *info = [NSString stringWithFormat:@"%@: Finished!",NSStringFromSelector(_cmd)];
//    [self appendConsoleLog:info];
    if (error) {
        info = [NSString stringWithFormat:@"%@: Error-%@!",NSStringFromSelector(_cmd),error.localizedDescription];
        [self appendConsoleLog:info];
    } else {
        info = [NSString stringWithFormat:@"%@: Success-You've added device %@ successfully!",NSStringFromSelector(_cmd),deviceModel.name];
        [self appendConsoleLog:info];
    }
}
- (void)clickedForgotPasswordBtn {
    [[TuyaSmartActivator sharedInstance] stopActiveSubDeviceWithGwId:_devIDValue];
    TuyaSmartDevice * device = [TuyaSmartDevice deviceWithDeviceId:_devIDValue];
    [device getSubDeviceListFromCloudWithSuccess:^(NSArray<TuyaSmartDeviceModel *> * _Nonnull subDeviceList) {
        NSLog(@"====");
    } failure:^(NSError *error) {
        NSLog(@"====");
    }];
}

- (void)countDown {
    timeout --;
    
    if (timeout) {
        [self performSelector:@selector(countDown) withObject:nil afterDelay:1];
        [self appendConsoleLog:[NSString stringWithFormat:@"%@: %@ seconds left before timeout.",NSStringFromSelector(_cmd),@(timeout)]];
    } else {
        timeout = timeLeft;
    }
}

- (void)requestToken {
    //6c5819bc9e2d945e6dapjb
    TuyaSmartHomeModel * model = [IOTRequestManger shareIOTRequestManger].homeManger.homes.firstObject;

    TuyaSmartHome *home = [TuyaSmartHome homeWithHomeId:model.homeId];
    [[TuyaSmartActivator sharedInstance] getTokenWithHomeId:model.homeId success:^(NSString *result) {
        _tokenValue = result;
    } failure:^(NSError *error) {
        
    }];
    //获取家庭详情
    [home getHomeDetailWithSuccess:^(TuyaSmartHomeModel *homeModel) {
        NSLog(@"===%@",homeModel);
    } failure:^(NSError *error) {
        NSLog(@"===%@",error);
    }];
    //获取设备列表 如果没有 就先请求上面获取家庭详情
    NSArray *devices = home.deviceList;
    TuyaSmartDeviceModel *gatewayDevice = nil;
    for (TuyaSmartDeviceModel *deviceModel in devices) {
        if (deviceModel.deviceType == TuyaSmartDeviceModelTypeZigbeeGateway && deviceModel.isOnline) {
            gatewayDevice = deviceModel;
            break;
        }
    }
    if (gatewayDevice) {
        _devIDValue = gatewayDevice.devId;
    }
    
}


#pragma mark - private

- (void)appendConsoleLog:(NSString *)logString {
    
    if (!logString) {
        logString = [NSString stringWithFormat:@"%@ : param error",NSStringFromSelector(_cmd)];
    }
    NSString *result = self.console.text?:@"";
    result = [[result stringByAppendingString:logString] stringByAppendingString:@"\n"];
    self.console.text = result;
    [self.console scrollRangeToVisible:NSMakeRange(result.length, 1)];
}

- (void)initView {
    
    //fifth line.
    self.console = [UITextView new];
    self.console.layer.borderColor = UIColor.blackColor.CGColor;
    self.console.layer.borderWidth = 1;
    [self.view addSubview:self.console];
    self.console.editable = NO;
    self.console.layoutManager.allowsNonContiguousLayout = NO;
    self.console.backgroundColor = [UIColor darkGrayColor];
    [self.console mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 100));
    }];
   
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.forgetBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(40);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-80);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
}

- (UIButton *)loginBtn {
    if (_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setBackgroundColor:[[YColorManger shareYColorManger] getdf2d1fColor]];
        [_loginBtn setTitle:@"配网" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[[YColorManger shareYColorManger] getFFFFFFColor] forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = FontSize(16);
        [_loginBtn addTarget:self action:@selector(clickedLoginBtn) forControlEvents:UIControlEventTouchUpInside];
        
        _loginBtn.layer.cornerRadius = 4;
    }
    return _loginBtn;
}

- (UIButton *)forgetBtn {
    if (_forgetBtn == nil) {
        _forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetBtn setBackgroundColor:[[YColorManger shareYColorManger] getdf2d1fColor]];
        [_forgetBtn setTitle:@"暂停配网" forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:[[YColorManger shareYColorManger] getFFFFFFColor] forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = FontSize(14);
        [_forgetBtn addTarget:self action:@selector(clickedForgotPasswordBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}

@end
