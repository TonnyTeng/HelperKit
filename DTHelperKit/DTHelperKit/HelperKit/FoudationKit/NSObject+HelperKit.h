//
//  NSObject+HelperKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HelperKit)

/**
 *	Get the name of currnet object's class.
 */
- (NSString *)className;

#pragma mark - Json to object and object to jason
/**
 *	Transform an object to json data.
 *
 *	@param object	Any kind of object.
 *
 *	@return json data object if transform successfully, otherwise return nil.
 */
+ (NSMutableData *)toJsonDataWithObject:(id)object;

/**
 *	Transform self to json data.
 *
 *	@return json data if transform successfully, otherwise return nil.
 */
- (NSMutableData *)toJsonData;

/**
 *	Transform an object to json string.
 *
 *	@param object	Any kind of object
 *
 *	@return json string if transform successfully, otherwise return nil.
 */
+ (NSString *)toJsonStringWithObject:(id)object;

/**
 *	Transform self to json string.
 *
 *	@return json string if transform successfully, otherwise return nil.
 */
- (NSString *)toJsonString;

#pragma mark - Filter Null and nil
/**
 *	Filter all nil and null object.
 */
- (id)filterNullNil;

/**
 *	Filter all nil and null object.
 *
 *	@param object	The object to be filtered.
 */
+ (id)filterNullNilFromObject:(id)object;

@end
