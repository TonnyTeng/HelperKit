//
//  UIWebView+HelperKitUIKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UIWebView+HelperKitUIKit.h"

@implementation UIWebView (HelperKitUIKit)

+ (instancetype)webViewWithDelegate:(id)delegate {
    return [self webViewWithDelegate:delegate superView:nil];
}

+ (instancetype)webViewWithDelegate:(id)delegate superView:(UIView *)superView edges:(UIEdgeInsets)edges {
    return [self webViewWithDelegate:delegate superView:superView];
}

+ (instancetype)webViewWithDelegate:(id)delegate
                              superView:(UIView *)superView {
    UIWebView *webView = [[UIWebView alloc] init];
    
    // 自适应屏幕大小进行缩放
    webView.userInteractionEnabled = YES;
    webView.delegate = delegate;
    webView.scalesPageToFit = YES;
    webView.scrollView.showsVerticalScrollIndicator = NO;
    [superView addSubview:webView];
    
    return webView;
}

@end
