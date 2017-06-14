//
//  NSTimer+HelperKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^TimerCallback)(NSTimer *timer);

@interface NSTimer (HelperKit)

/**
 *	Create a timer with time interval, repeat or not, and callback.
 *
 *	@param interval	Time interval
 *	@param repeats	Whether repeat to schedule.
 *	@param callback The callback block.
 *
 *	@return Timer object.
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    repeats:(BOOL)repeats
                                   callback:(TimerCallback)callback;

/**
 *	Create a timer with time interval, repeat count, and callback.
 *
 *	@param interval	Time interval
 *	@param count		When count <= 0, it means repeat.
 *	@param callback	The callback block
 *
 *	@return Timer object
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      count:(NSInteger)count
                                   callback:(TimerCallback)callback;

/**
 *	Start timer immediately.
 */
- (void)fireTimer;

/**
 *	Pause timer immediately
 */
- (void)unfireTimer;

/**
 *	Make timer invalidate.
 */
- (void)invalidate;

@end
