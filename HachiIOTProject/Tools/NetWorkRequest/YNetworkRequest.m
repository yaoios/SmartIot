//
//  YNetworkRequest.m
//  YIOTDemo
//
//  Created by xuguangyao on 2020/3/25.
//  Copyright © 2020 com.haqi. All rights reserved.
//

#import "YNetworkRequest.h"
#import <AFNetworking.h>
@implementation YNetworkRequest


+(void)postWithURLString:(NSString *)urlString parameters:(NSDictionary *)par success:(void (^) (NSDictionary*dic))result error:(void(^)(NSError *))err {
    AFHTTPSessionManager* manager = [self sharedHTTPSession];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/xml", @"text/xml", @"text/html",@"application/json", @"text/plain",@"image/jpeg", nil];
    if ([urlString isEqualToString:SmartIOTAuthToken] ||[urlString isEqualToString:SmartIOTCreatAndEditorHome]) {
       
        NSString * value = [NSString stringWithFormat:@"Bearer %@",[UserModel shareUserModel].token];
            
        [manager.requestSerializer setValue:value forHTTPHeaderField:@"X-Authorization"];

    }
    [manager POST:urlString parameters:par progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (result) {
            NSError *err = nil;
                   
            NSDictionary *dic = [NSJSONSerialization  JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&err];
                         
            result(dic);
        }
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (err) {
            err(error);
        }
    }];
}


+(void)postFormWithURLString:(NSString *)urlString parameters:(NSDictionary *)par success:(void (^) (NSDictionary*dic))result error:(void(^)(NSError *))err {
   
    AFHTTPSessionManager* manager = [self sharedHTTPSession];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/xml", @"text/xml", @"text/html",@"application/json", @"text/plain",@"image/jpeg",@"text/javascript", nil];
     
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
     NSString * value = [NSString stringWithFormat:@"Bearer %@",[UserModel shareUserModel].token];
     
     [manager.requestSerializer setValue:value forHTTPHeaderField:@"X-Authorization"];
    
    [manager POST:urlString parameters:par progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (result) {
            NSError *err = nil;
            
            NSDictionary *dic = [NSJSONSerialization  JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&err];
                  
            result(dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (err) {
           err(error);
        }
        
    }];
}

+(void)getWithURLString:(NSString *)urlString parameters:(NSDictionary *)par success:(void (^) (NSDictionary*dic))result error:(void(^)(NSError *))err {
    AFHTTPSessionManager* manager = [self sharedHTTPSession];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 30.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/xml", @"text/xml", @"text/html",@"application/json", @"text/plain",@"image/jpeg", nil];
    NSString * value = [NSString stringWithFormat:@"Bearer %@",[UserModel shareUserModel].token];
    [manager.requestSerializer setValue:value forHTTPHeaderField:@"X-Authorization"];
    [manager GET:urlString parameters:par progress:^(NSProgress * _Nonnull downloadProgress) {
           
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          
        if (result) {
            NSError *err = nil;
                     
            NSDictionary *dic = [NSJSONSerialization  JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&err];
                           
            result(dic);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (err) {
            err(error);
        }
    }];
}


+ (AFHTTPSessionManager *)sharedHTTPSession {
    static AFHTTPSessionManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        
    });
    return manager;
}

@end
