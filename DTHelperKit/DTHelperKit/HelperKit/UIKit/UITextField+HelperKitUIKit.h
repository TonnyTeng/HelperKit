//
//  UITextField+HelperKitUIKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (HelperKitUIKit)


@property (nonatomic, assign) CGFloat leftMarginOfCursor;

+ (instancetype)textFieldWithHolder:(NSString *)holder
                              superView:(UIView *)superView;

+ (UITextField *)textFieldWithHolder:(NSString *)holder
                                delegate:(id<UITextFieldDelegate>)delegate
                               superView:(UIView *)superView;

+ (UITextField *)textFieldWithHolder:(NSString *)holder
                                    text:(NSString *)text
                               superView:(UIView *)superView;


+ (UITextField *)textFieldWithHolder:(NSString *)holder
                                    text:(NSString *)text
                                delegate:(id<UITextFieldDelegate>)delegate
                               superView:(UIView *)superView;

@end
