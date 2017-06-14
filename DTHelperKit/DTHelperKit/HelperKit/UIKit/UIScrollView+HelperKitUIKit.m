//
//  UIScrollView+HelperKitUIKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UIScrollView+HelperKitUIKit.h"

@implementation UIScrollView (HelperKitUIKit)

+ (instancetype)scrollViewWithDelegate:(id)delegate {
    return [self scrollViewWithDelegate:delegate superView:nil];
}



+ (instancetype)scrollViewWithDelegate:(id)delegate
                                 superView:(UIView *)superView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [superView addSubview:scrollView];
    
    scrollView.delegate = delegate;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    
    return scrollView;
}

@end
