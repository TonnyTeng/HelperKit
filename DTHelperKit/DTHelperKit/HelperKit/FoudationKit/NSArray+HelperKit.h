//
//  NSArray+HelperKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HelperKit)

- (NSArray *)head:(NSUInteger)count;
- (NSArray *)tail:(NSUInteger)count;
//元素逆转
- (NSArray *)reverseArray;

@end


@interface NSMutableArray (HelperKit)

- (NSMutableArray *)pushHead:(NSObject *)obj;
- (NSMutableArray *)popHead;

- (NSMutableArray *)pushHeads:(NSArray *)all;
- (NSMutableArray *)popHeads:(NSUInteger)n;

- (NSMutableArray *)pushTail:(NSObject *)obj;
- (NSMutableArray *)popTail;

- (NSMutableArray *)pushTails:(NSArray *)all;
- (NSMutableArray *)popTails:(NSUInteger)n;

- (NSMutableArray *)keepHead:(NSUInteger)n;
- (NSMutableArray *)keepTail:(NSUInteger)n;

- (void)moveObjectAtIndex:(NSUInteger)index1 toIndex:(NSUInteger)index2;
//元素逆转
- (NSArray *)reverseArray;

@end
