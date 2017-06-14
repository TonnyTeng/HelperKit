//
//  XTSystemInfo.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTSystemInfo : NSObject

+ (NSString *)osVersion;

+ (NSString *)appVersion	NS_AVAILABLE_IOS(4_0);
+ (NSString *)appBuild      NS_AVAILABLE_IOS(4_0);
+ (NSString *)deviceModel	NS_AVAILABLE_IOS(4_0);
+ (NSString *)deviceUUID	NS_AVAILABLE_IOS(4_0);

+ (BOOL)isJailBroken		NS_AVAILABLE_IOS(4_0);
+ (NSString *)jailBreaker	NS_AVAILABLE_IOS(4_0);

// 获取当前设备可用内存(单位：MB）
+ (double)availableMemory;
// 获取当前任务所占用的内存（单位：MB）
+ (double)usedMemory;
//获取当前设备剩余存储空间(单位：MB)
+ (NSString *)freeDiskSpaceInBytes;

@end
