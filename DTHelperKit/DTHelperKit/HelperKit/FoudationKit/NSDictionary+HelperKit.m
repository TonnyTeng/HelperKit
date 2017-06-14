//
//  NSDictionary+HelperKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "NSDictionary+HelperKit.h"
#import "CommonKit.h"

@implementation NSDictionary (HelperKit)

- (BOOL)writeToPlistFilePath:(NSString *)filePath
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    BOOL didWriteSuccessfull = [data writeToFile:filePath atomically:YES];
    return didWriteSuccessfull;
}

- (id)initWithPlistOfFilePath:(NSString *)filePath
{
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}


- (int)intForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self numberForKey:key];
    
    return [number intValue];
}

- (double)doubleForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self numberForKey:key];
    
    return [number doubleValue];
}

- (float)floatForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self numberForKey:key];
    
    return [number floatValue];
}

- (NSInteger)integerForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    NSNumber *number = [self numberForKey:key];
    
    return [number integerValue];
}

- (NSString *)stringForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString *)obj;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@", obj];
    }
    
    return nil;
}


- (NSDictionary *)dictionaryForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self objectForKey:key];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    }
    
    return nil;
}

- (NSArray *)arrayForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self objectForKey:key];
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *)obj;
    }
    
    return nil;
}

- (NSNumber *)numberForKey:(id)key {
    if (key == nil) {
        return 0;
    }
    
    id obj = [self objectForKey:key];
    if ([obj isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)obj;
    }
    
    return nil;
}

- (BOOL)boolForKey:(id)key {
    if (key == nil) {
        return NO;
    }
    
    id number = [self objectForKey:key];
    if ([number respondsToSelector:@selector(boolValue)]) {
        return [number boolValue];
    }
    
    return NO;
}

- (unsigned long long)unsignedLongLongValue:(id<NSCopying>)key {
    if (key == nil) {
        return 0;
    }
    
    id number = [self objectForKey:key];
    if ([number respondsToSelector:@selector(unsignedLongLongValue)]) {
        return [number unsignedLongLongValue];
    }
    
    return 0;
}

@end

@implementation NSMutableDictionary (HelperKit)


- (void)removeAllNilObjects
{
    NSArray *allKeys = [self allKeys];
    for (NSString *key in allKeys)
    {
        id object = [self objectForKey:key];
        if (!object || [object isKindOfClass:[NSNull class]])
        {
            [self removeObjectForKey:key];
        }
        else if([[object class] isSubclassOfClass:[NSString class]])
        {
            if ([object isEqualToString:@" "] || [object isEqualToString:@"null"])
            {
                [self removeObjectForKey:key];
            }
        }
    }
}
@end

