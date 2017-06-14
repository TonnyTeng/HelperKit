//
//  NSDate+HelperKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <Foundation/Foundation.h>

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

@interface NSDate (HelperKit)

//获取 当前日期 的 年月日时分秒
- (NSUInteger)day;
- (NSUInteger)month;
- (NSUInteger)year;
- (NSUInteger)hour;
- (NSUInteger)minute;
- (NSUInteger)second;

//获取 指定日期 的 年月日时分秒
+ (NSUInteger)day:(NSDate *)date;
+ (NSUInteger)month:(NSDate *)date;
+ (NSUInteger)year:(NSDate *)date;
+ (NSUInteger)hour:(NSDate *)date;
+ (NSUInteger)minute:(NSDate *)date;
+ (NSUInteger)second:(NSDate *)date;

//今年的天数
- (NSUInteger)daysInYear;

//指定年份的天数
+ (NSUInteger)daysInYear:(NSDate *)date;

//判断今年是否闰年
- (BOOL)isLeapYear;

//判断指定年份是否闰年
+ (BOOL)isLeapYear:(NSDate *)date;

+ (BOOL)isLeapYearWithYear:(int)year;

/**
 
 *
 *	Get which week in the year.
 *
 *	@return Current week of year.
 */
- (NSUInteger)weekOfYear;

/**
 
 *
 *	Get which week in the specified date.
 *
 *	@param date	The specified date to get which week.
 *
 *	@return Current week of the specified year.
 */
+ (NSUInteger)weekOfYear:(NSDate *)date;

//获取格式化为YYYY-MM-dd格式的日期字符串
- (NSString *)toStringWithFormatYMD;

+ (NSString *)toStringWithFormatYMD:(NSDate *)date;

//当前月份的周数
- (NSUInteger)howManyWeeksOfMonth;
//指定月份的周数
+ (NSUInteger)howManyWeeksOfMonth:(NSDate *)date;

//当前月份的第一天
- (NSDate *)beginDayOfMonth;
//指定月份的第一天
+ (NSDate *)beginDayOfMonth:(NSDate *)date;

//当前月份的最后一天
- (NSDate *)lastDayOfMonth;

//指定月份的最后一天
+ (NSDate *)lastDayOfMonth:(NSDate *)date;

//今天之后的第几天
- (NSDate *)dateAfterDay:(NSUInteger)days;

//指定日期之后的第几天
+ (NSDate *)dateAfterDate:(NSDate *)date day:(NSInteger)days;

//今天之后的第几月
- (NSDate *)dateAfterMonth:(NSUInteger)months;

//指定日期之后的第几月
+ (NSDate *)dateAfterDate:(NSDate *)date month:(NSInteger)months;

/**
 * 返回numYears年后的日期
 */

- (NSDate *)offsetYears:(int)numYears;
+ (NSDate *)offsetYears:(int)numYears fromDate:(NSDate *)fromDate;
- (NSDate *)offsetMonths:(int)numMonths;
+ (NSDate *)offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;
- (NSDate *)offsetDays:(int)numDays;
+ (NSDate *)offsetDays:(int)numDays fromDate:(NSDate *)fromDate;
- (NSDate *)offsetHours:(int)hours;
+ (NSDate *)offsetHours:(int)numHours fromDate:(NSDate *)fromDate;
- (NSUInteger)daysAgo;
+ (NSUInteger)daysAgo:(NSDate *)date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)weekday;
+ (NSInteger)weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)dayFromWeekday;
+ (NSString *)dayFromWeekday:(NSDate *)date;

//是否同一天
- (BOOL)isSameDate:(NSDate *)anotherDate;

//指定日期是否为今天
- (BOOL)isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)dateByAddingDays:(NSUInteger)days;

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)monthWithMonthNumber:(NSInteger)month;

/**
 *  Convert date to string with format.
 */
+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)stringWithFormat:(NSString *)format;

/**
 * Convert date string to NSDate instance.
 */
+ (NSDate *)dateWithString:(NSString *)string format:(NSString *)format;

/**
 * Get how many days in the month.
 */
- (NSUInteger)daysInMonth:(NSUInteger)month;
+ (NSUInteger)daysInMonth:(NSDate *)date month:(NSUInteger)month;
+ (NSUInteger)dayInYear:(NSUInteger)year month:(NSUInteger)month;

/**
 * Get how many days in the month.
 */
- (NSUInteger)daysInMonth;
+ (NSUInteger)daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)timeInfo;
+ (NSString *)timeInfoWithDate:(NSDate *)date;
+ (NSString *)timeInfoWithDateString:(NSString *)dateString;

/**
 * yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss
 */
- (NSString *)ymdFormat;
- (NSString *)hmsFormat;
- (NSString *)ymdHmsFormat;
+ (NSString *)ymdFormat;
+ (NSString *)hmsFormat;
+ (NSString *)ymdHmsFormat;

+ (NSDateComponents *)dateComponentsWithDate:(NSDate *)date;

//指定时间转时间戳
- (NSString *)toTimeStamp;

//时间戳转时间
+ (NSDate *)toDateWithTimeStamp:(NSString *)timeStamp;

@end
