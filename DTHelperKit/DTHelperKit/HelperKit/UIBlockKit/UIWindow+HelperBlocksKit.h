//
//  UIWindow+HelperBlocksKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

//位置
typedef NS_ENUM(NSInteger, ViewLocation){
    kViewLocationTop,
    kViewLocationCenter,
    kViewLocationBottom,
};

//动画
typedef NS_ENUM(NSInteger, ViewAnimation){
    kViewAnimationTop,
    kViewAnimationBottom,
    kViewAnimationLeft,
    kViewAnimationRight,
};


@interface UIWindow (HelperBlocksKit)

- (void)showBottomView:(UIView *)view;
- (void)showView:(UIView *)view location:(ViewLocation)location animation:(ViewAnimation)animation;

- (void)hideBottomView;
- (void)hideViewWithAnimation:(ViewAnimation)animation;

@end
