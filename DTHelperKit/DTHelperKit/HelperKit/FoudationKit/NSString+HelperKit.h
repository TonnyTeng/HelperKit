//
//  NSString+HelperKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (HelperKit)

#pragma mark - Encrypt and decrypt
/**
 *	Convert the string to 32bit md5 string.
 *
 *	@return 32bit md5
 */
- (NSString *)toMD5;

/**
 *	Convert the string to 16bit md5 string.
 *
 *	@return 16bit md5
 */
- (NSString *)to16MD5;

/**
 *	Encrypt the string with sha1 argorithm.
 *
 *	@return The sha1 string.
 */
- (NSString *)sha1;

/**
 *	Encrypt the string with sha256 argorithm.
 *
 *	@return The sha256 string.
 */
- (NSString *)sha256;

/**
 *	Encrypt the string with sha512 argorithm.
 *
 *	@return The sha512 string.
 */
- (NSString *)sha512;

#pragma mark - Data convert to string or string to data.
/**
 *	Convert the current string to data.
 *
 *	@return data object if convert successfully, otherwise nil.
 */
- (NSData *)toData;

/**
 *	Convert a data object to string.
 *
 *	@param data	The data will be converted.
 *
 *	@return string object if convert successfully, otherwise nil.
 */
+ (NSString *)toStringWithData:(NSData *)data;

#pragma mark - Check email, phone, tel, or persion id.
/**
 *	Check whether the string is a valid kind of email format.
 *
 *	@return YES if it is a valid format, otherwise false.
 */
- (BOOL)isEmail;

/**
 *	Check whether the string is a valid kind of email format.
 *
 *	@param email The string to be checked.
 *
 *	@return YES if it is a valid format, otherwise false.
 */
+ (BOOL)isEmail:(NSString *)email;

/**
 *	Check whether the string is a valid kind of mobile phone format.
 *  Now only check 11 numbers and begin with 1.
 *
 *	@return YES if passed, otherwise false.
 */
- (BOOL)isMobilePhone;

/**
 *	Check whether the string is a valid kind of mobile phone format.
 *
 *  @param phone The phone to be checked.
 *
 *	@return YES if passed, otherwise false.
 */
+ (BOOL)isMobilePhone:(NSString *)phone;

/**
 *	Check whether it is a valid kind of tel number format.
 *
 *	@return YES if passed, otherwise false.
 */
- (BOOL)isTelNumber;

/**
 *	Check whether it is a valid kind of tel number format.
 *
 *	@param telNumber	The tel number to be checked.
 *
 *	@return YES if passed, otherwise false.
 */
+ (BOOL)isTelNumber:(NSString *)telNumber;

/**
 *	Check whether it is a valid kind of Chinese Persion ID
 *
 *	@return YES if it is valid kind of PID, otherwise false.
 */
- (BOOL)isPersonID;

/**
 *	Check whether it is a valid kind of Chinese Persion ID
 *
 *	@param PID	The Chinese Persion ID to be checked.
 *
 *	@return YES if it is valid kind of PID, otherwise false.
 */
+ (BOOL)isPersonID:(NSString *)PID;

#pragma mark - Trim Character
/**
 *	Trim the left blank space
 *
 *	@return The new string without left blank space.
 */
- (NSString *)trimLeft;

/**
 *	Trim the right blank space
 *
 *	@return The new string without right blank space.
 */
- (NSString *)trimRight;

/**
 *	Trim the left and the right blank space
 *
 *	@return The new string without left and right blank space.
 */
- (NSString *)trim;

/**
 *	Trim all blank space in the string.
 *
 *	@return The new string without blank space.
 */
- (NSString *)trimAll;

/**
 *	Trim letters.
 *
 *	@return The new string without letters.
 */
- (NSString *)trimLetters;

/**
 *	Trim all the specified characters.
 *
 *	@param character	The character to be trimed.
 *
 *	@return The new string without the specified character.
 */
- (NSString *)trimCharacter:(unichar)character;

/**
 *	Trim white space.
 *
 *	@return The new string without white space.
 */
- (NSString *)trimWhitespace;

/**
 *	Trim all whitespace and new line.
 *
 *	@return The new string without white space and new line.
 */
- (NSString *)trimWhitespaceAndNewLine;

#pragma mark - Check letters, numbers or letter and numbers
/**
 *	Check whether it only contains letters.
 *
 *	@return YES if only containing letters, otherwise NO.
 */
- (BOOL)isOnlyLetters;

/**
 *	Check whether it only contains digit numbers.
 *
 *	@return YES if only containing digit numbers, otherwise NO.
 */
- (BOOL)isOnlyDigits;

/**
 *	Check whether it only contains letters and digit numbers.
 *
 *	@return YES if only containing letters and digit numbers, otherwise NO.
 */
- (BOOL)isOnlyAlphaNumeric;

#pragma mark - URL
/**
 *	Try to convert the string to a NSURL object.
 *
 *	@return NSURL object if converts successfully, otherwise nil.
 */
- (NSURL *)toURL;

/**
 *	Try to do a url encode.
 *
 *	@return Encoded string.
 */
- (NSString *)URLEncode;

#pragma mark - HTML
/**
 *	Filter html tags in the string.
 *
 *	@return A new string without html tags.
 */
- (NSString *)filterHtml;

/**
 *	Fileter html tags in the specified string.
 *
 *	@param html	The specified html string.
 *
 *	@return A new string without html tags.
 */
+ (NSString *)filterHTML:(NSString *)html;

#pragma mark - Get document/tmp/Cache path
/**
 *	Get the absolute path of the document.
 *
 *	@return Document path.
 */
+ (NSString *)documentPath;

/**
 *	Get the absolute path of tmp
 *
 *	@return Tmp path
 */
+ (NSString *)tmpPath;

/**
 *	Get the absolute path of Cache.
 *
 *	@return Cache absolute path
 */
+ (NSString *)cachePath;

#pragma mark - String operation
/**
 *	Check whether current string contains the substring.
 *
 *	@param substring	Substring
 *
 *	@return YES if containing, otherwise NO.
 */
- (BOOL)isContainString:(NSString *)substring;


#pragma mark - Ohter



- (CGSize)sizeWithFont:(UIFont *)font byWidth:(CGFloat)width;
- (CGSize)sizeWithFont:(UIFont *)font byHeight:(CGFloat)height;

/**
 同一Label不同颜色

 @param string 需要不同色的文本
 @param length 从第length长度开始变色
 @param color 左边字体颜色
 @return attributedText
 */
+ (NSMutableAttributedString *)multipleColorWithPlaceholder:(NSString *)string length:(NSUInteger)length leftColor:(UIColor *)color;


@end
