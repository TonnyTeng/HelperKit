//
//  UIControl+HelperKitUIKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (HelperKitUIKit)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)(id sender))block;

- (void)removeHandlerForEvent:(UIControlEvents)event;

@end
