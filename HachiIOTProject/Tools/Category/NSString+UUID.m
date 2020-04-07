//
//  NSString+UUID.m
//  Encapsulation
//
//  Created by zhao on 2016/11/23.
//  Copyright © 2016年 zhaoName. All rights reserved.
//  获取UUID并存储到keyChain

#import "NSString+UUID.h"

@class KeyChainStore;
@implementation NSString (UUID)

+ (NSString *)getUUID
{
    NSString * strUUID = (NSString *)[KeyChainStore load:@"HachiSmart.SmartIOTDistribution.com"];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //获取UUID
        strUUID = [UIDevice currentDevice].identifierForVendor.UUIDString;
        //将该uuid保存到keychain
        [KeyChainStore save:@"HachiSmart.SmartIOTDistribution.com" data:strUUID];
    }
    return strUUID;
}


@end

#pragma mark -- KeyChainStore

@implementation KeyChainStore

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

// 将UUID保存到钥匙串
+ (void)save:(NSString *)service data:(id)data
{
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

// 读取保存到钥匙串的UUID
+ (id)load:(NSString *)service
{
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr)
    {
        @try{
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

// 删除保存到钥匙串的UUID
+ (void)deleteKeyData:(NSString *)service
{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

@end
