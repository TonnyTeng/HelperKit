//
//  NSFileManager+HelperKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "NSFileManager+HelperKit.h"
#import "NSDictionary+HelperKit.h"

@implementation NSFileManager (HelperKit)


- (BOOL)isFileAtPath:(NSString *)filePath hasTimeOut:(NSTimeInterval)timeout {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSError *error = nil;
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath
                                                                                    error:&error];
        if (error) {
            return YES;
        }
        
        if ([attributes isKindOfClass:[NSDictionary class]] && attributes) {
            NSString *createDate = [attributes objectForKey:@"NSFileModificationDate"];
            createDate = [NSString stringWithFormat:@"%@", createDate];
            if (createDate.length >= 19) {
                createDate = [createDate substringToIndex:19];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
                
                NSDate *sinceDate = [formatter dateFromString:createDate];
                NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:sinceDate];
                BOOL isTimeOut = (long)interval > timeout;
                
                return isTimeOut;
            }
        }
    }
    
    return YES;
}

- (NSDictionary *)fileAttributesAtPath:(NSString *)path {
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:path
                                                                           error:&error];
    if (error) {
        return nil;
    }
    
    return attrs;
}

- (unsigned long long)fileSizeAtPath:(NSString *)path {
    NSDictionary *attrs = [self fileAttributesAtPath:path];
    
    if (attrs == nil) {
        return 0;
    }
    
    return [attrs unsignedLongLongValue:NSFileSize];
}

@end
