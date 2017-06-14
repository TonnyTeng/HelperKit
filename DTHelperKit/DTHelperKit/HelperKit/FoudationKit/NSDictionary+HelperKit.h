//
//  NSDictionary+HelperKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HelperKit)

- (BOOL)writeToPlistFilePath:(NSString *)filePath;
- (id)initWithPlistOfFilePath:(NSString *)filePath;

/**
 
 *
 *  Get int value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return int value of key, or zero if key doesn't exist
 */
- (int)intForKey:(id<NSCopying>)key;

/**
 
 *
 *  Get double value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return double value of key, or zero if key doesn't exist
 */
- (double)doubleForKey:(id<NSCopying>)key;

/**
 
 *
 *  Get float value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return float value of key, or zero if key doesn't exist
 */
- (float)floatForKey:(id<NSCopying>)key;

/**
 
 *
 *  Get NSInteger value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSInteger value of key, or zero if key doesn't exist
 */
- (NSInteger)integerForKey:(id<NSCopying>)key;

/**
 
 *
 *  Get NSString value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSString value of key, or nil if key doesn't exist
 */
- (NSString *)stringForKey:(id<NSCopying>)key;

/**
 
 *
 *  Get NSDictionary value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSDictionary value of key, or nil if key doesn't exist
 */
- (NSDictionary *)dictionaryForKey:(id<NSCopying>)key;

/**
 
 *
 *  Get NSArray value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSArray value of key, or nil if key doesn't exist
 */
- (NSArray *)arrayForKey:(id<NSCopying>)key;

/**
 
 *
 *  Get NSNumber value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return NSNumber value of key, or nil if key doesn't exist
 */
- (NSNumber *)numberForKey:(id<NSCopying>)key;

/**
 
 *
 *  Get BOOL value from dictionary by key.
 *
 *	@param key	key
 *
 *	@return BOOL value of key, or false if key doesn't exist
 */
- (BOOL)boolForKey:(id<NSCopying>)key;

/**
 
 *
 *	Get the unsigned long long value form dict by key.
 *
 *	@param key	The key
 *
 *	@return unsigned long long value of key, or 0 if key doesn't exist.
 */
- (unsigned long long)unsignedLongLongValue:(id<NSCopying>)key;

@end

@interface NSMutableDictionary (HelperKit)

- (void)removeAllNilObjects;

@end
