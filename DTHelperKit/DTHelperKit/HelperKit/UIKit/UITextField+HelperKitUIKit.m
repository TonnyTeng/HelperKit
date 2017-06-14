//
//  UITextField+HelperKitUIKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UITextField+HelperKitUIKit.h"
#import <objc/runtime.h>
#import "UIView+HelperKitUIKit.h"

static const void *s_leftMarginOfCursorKey = "s_leftMarginOfCursor";

@implementation UITextField (HelperKitUIKit)

- (CGFloat)leftMarginOfCursor {
    NSNumber *number = objc_getAssociatedObject(self, s_leftMarginOfCursorKey);
    
    if ([number respondsToSelector:@selector(floatValue)]) {
        return [number floatValue];
    }
    
    return 8.0;
}

- (void)setleftMarginOfCursor:(CGFloat)leftMarginOfCursor {
    objc_setAssociatedObject(self,
                             s_leftMarginOfCursorKey,
                             @(leftMarginOfCursor),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (self.leftView) {
        self.leftView.width = leftMarginOfCursor;
    }
}

+ (instancetype)textFieldWithHolder:(NSString *)holder
                              superView:(UIView *)superView {
    return [self textFieldWithHolder:holder
                                    text:nil
                               superView:superView];
}

+ (UITextField *)textFieldWithHolder:(NSString *)holder
                                    text:(NSString *)text
                               superView:(UIView *)superView {
    return [self textFieldWithHolder:holder
                                    text:text
                                delegate:nil
                               superView:superView];
}

+ (UITextField *)textFieldWithHolder:(NSString *)holder
                                delegate:(id<UITextFieldDelegate>)delegate
                               superView:(UIView *)superView {
    return [self textFieldWithHolder:holder
                                    text:nil
                                delegate:delegate
                               superView:superView];
}

+ (UITextField *)textFieldWithHolder:(NSString *)holder
                                    text:(NSString *)text
                                delegate:(id<UITextFieldDelegate>)delegate
                               superView:(UIView *)superView {
    UITextField *textField = [[UITextField alloc] init];
    textField.borderStyle = UITextBorderStyleNone;
    textField.leftView = [[UIView alloc] init];
    textField.leftView.backgroundColor = [UIColor clearColor];
    textField.leftView.width = textField.leftMarginOfCursor;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.spellCheckingType = UITextSpellCheckingTypeNo;
    textField.delegate = delegate;
    [superView addSubview:textField];
    
    textField.placeholder = holder;
    textField.text = text;
    
    return textField;
}

@end
