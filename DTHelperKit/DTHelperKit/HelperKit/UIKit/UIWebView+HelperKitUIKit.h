//
//  UIWebView+HelperKitUIKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (HelperKitUIKit)


+ (instancetype)webViewWithDelegate:(id)delegate;

+ (instancetype)webViewWithDelegate:(id)delegate superView:(UIView *)superView;

+ (instancetype)webViewWithDelegate:(id)delegate
                              superView:(UIView *)superView
                                  edges:(UIEdgeInsets)edges;


@end
