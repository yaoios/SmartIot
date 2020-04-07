//
//  UrlConfig.h
//  hachiSmartHome
//
//  Created by apple on 2018/1/12.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#ifndef UrlConfig_h
#define UrlConfig_h

//内部版本号 每次发版递增
#define KVersionCode 1
/*
 
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */
#define DevelopSever    1  //测试
#define TestSever       0  //预发布
#define ProductSever    0  //线上


#if DevelopSever  /**测试服务器*/

#define URL_main @"http://172.16.1.236:8080/"


#elif TestSever  /**预发布服务器*/




#elif ProductSever  /**生产服务器*/



#endif

#pragma mark - ——————— 涂鸦appkey ————————

#define SDK_APPKEY     @"tc9rv387hrpjs83c8m5m"
#define SDK_APPSECRET  @"gythvwfxjwqs383dcuggtjww4tsaks3r"

#pragma mark - ——————— 详细接口地址 ————————

#pragma mark -- 登陆接口 ----
#define SmartIOTLogin URL_main@"api/app/user/login"

#pragma mark -- 注册接口 ----
#define SmartIOTRegiser URL_main@"api/app/user/register-user"

#pragma mark -- 修改密码接口 ----
#define SmartIOTModifyPassword URL_main@"api/app/user/update-password"

#pragma mark -- 获取验证码 ----
#define SmartIOTVerifyCode URL_main@"api/app/verifycode/send"

#pragma mark -- 家庭列表接口 ----
#define SmartIOTHomeList URL_main@"api/app/family/list"

#pragma mark -- 家庭创建和编辑 ----
#define SmartIOTCreatAndEditorHome URL_main@"api/app/family/save"

#pragma mark -- 房间列表 ----
#define SmartIOTRoomList URL_main@"api/app/room/list"

#pragma mark -- 房间创建和编辑 ----
#define SmartIOTCreatAndEditorRoom URL_main@"api/app/room/save"

#pragma mark -- 获取设备列表 ----
#define SmartIOTDeviceList URL_main@"api/app/family/devices"

#pragma mark -- 获取网关下子设备列表 ----
#define SmartIOTGatewauSubdeviceList URL_main@"api/app/family/child-devices"

#pragma mark -- 家庭删除  ----
#define SmartIOTDelteHome URL_main@"api/app/family"

#pragma mark -- 房间删除  ----
#define SmartIOTDelteRoom URL_main@"api/app/room"

#pragma mark -- 刷新token (保持登陆的token) ----
#define SmartIOTAuthToken URL_main@"api/app/auth/token"

#pragma mark -- 设备配网token (保持登陆的token) ----
#define SmartIOTDeviceToken URL_main@"api/app/tuya/device/token"

#pragma mark -- tuya设备删除 ----
#define SmartIOTTuYaRemoveDevice URL_main@"api/app/tuya/device/remove"

#endif /* UrlConfig_h */
