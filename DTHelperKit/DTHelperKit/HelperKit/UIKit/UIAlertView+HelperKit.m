//
//  UIAlertView+HelperKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UIAlertView+HelperKit.h"
#import <objc/runtime.h>
#import "CommonKit.h"

static const void *s_privateAlertViewKey = "s_privateAlertViewKey";

@interface UIApplication(DTAlertView)<UIAlertViewDelegate>

@end

@implementation UIApplication(DTAlertView)

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.clickedButtonBlock) {
        alertView.clickedButtonBlock(alertView, buttonIndex);
    }
}

@end


@implementation UIAlertView (HelperKit)

- (void)setClickedButtonBlock:(AlertClickedButtonBlock)clickedButtonBlock {
    objc_setAssociatedObject(self,
                             s_privateAlertViewKey,
                             clickedButtonBlock,
                             OBJC_ASSOCIATION_COPY);
}

+ (instancetype)showWithTitle:(NSString *)title
                      message:(NSString *)message
                 buttonTitles:(NSArray *)buttonTitles
                        block:(AlertClickedButtonBlock)block {
    NSString *ok = nil;
    if (kIsArray(buttonTitles) && buttonTitles.count > 0) {
        ok = [buttonTitles objectAtIndex:0];
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:[UIApplication sharedApplication]
                                              cancelButtonTitle:ok
                                              otherButtonTitles:
                                    [buttonTitles objectAtIndex:1],
                                    [buttonTitles objectAtIndex:2],
                                    [buttonTitles objectAtIndex:3],
                                    [buttonTitles objectAtIndex:4],
                                    [buttonTitles objectAtIndex:5],
                                    [buttonTitles objectAtIndex:6],
                                    [buttonTitles objectAtIndex:7],
                                    [buttonTitles objectAtIndex:8],
                                    [buttonTitles objectAtIndex:9],
                                    [buttonTitles objectAtIndex:10],
                                    [buttonTitles objectAtIndex:11],
                                    [buttonTitles objectAtIndex:12],
                                    [buttonTitles objectAtIndex:13],
                                    [buttonTitles objectAtIndex:14],
                                    nil];
    alertView.clickedButtonBlock = block;
    
    [alertView show];
    
    return alertView;
}

@end
