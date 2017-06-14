//
//  UIScrollView+HelperKitUIKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (HelperKitUIKit)

+ (instancetype)scrollViewWithDelegate:(id)delegate;

+ (instancetype)scrollViewWithDelegate:(id)delegate
                                 superView:(UIView *)superView;


@end
