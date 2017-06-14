//
//  NSFileManager+HelperKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (HelperKit)

/**
 *
 *	Judge whether file at path exists and check time out or not.
 *
 *	@param filePath	The file absolute path
 *	@param timeout	The specified time out.
 *
 *	@return NO if file exists and hasn't exceeded the specified time, otherwise YES.
 */
- (BOOL)isFileAtPath:(NSString *)filePath hasTimeOut:(NSTimeInterval)timeout;

/**
 *
 *	Get attributes of file at path.
 *
 *	@param path	The file path
 *
 *	@return The file attributes if file exists, otherwise nil.
 */
- (NSDictionary *)fileAttributesAtPath:(NSString *)path;

/**
 *
 *	Get file size at path
 *
 *	@param path	The file path
 *
 *	@return File real size at path, or 0 if file doesn't exist.
 */
- (unsigned long long)fileSizeAtPath:(NSString *)path;

@end
