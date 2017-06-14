//
//  UIActionSheet+HelperKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UIActionSheet+HelperKit.h"
#import <objc/runtime.h>

static const void *s_ActionSheetClickedButtonBlock = "s_ActionSheetClickedButtonBlock";

@interface UIApplication (DTActionSheet) <UIActionSheetDelegate>

@end

@implementation UIApplication (DTActionSheet)

- (void)actionSheet:(nonnull UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.clickedButtonBlock) {
        actionSheet.clickedButtonBlock(actionSheet, buttonIndex);
    }
}

@end


@implementation UIActionSheet (HelperKit)

- (void)setClickedButtonBlock:(ActionSheetClickedButtonBlock)clickedButtonBlock {
    objc_setAssociatedObject(self,
                             s_ActionSheetClickedButtonBlock,
                             clickedButtonBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ActionSheetClickedButtonBlock)clickedButtonBlock {
    return objc_getAssociatedObject(self, s_ActionSheetClickedButtonBlock);
}

+ (instancetype)showInView:(UIView *)inView
                         title:(NSString *)title
                   cancelTitle:(NSString *)cancelTitle
              destructiveTitle:(NSString *)destructiveTitle
                   otherTitles:(NSArray *)otherTitles
                      callback:(ActionSheetClickedButtonBlock)callback {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                    delegate:[UIApplication sharedApplication]
                                           cancelButtonTitle:cancelTitle
                                      destructiveButtonTitle:destructiveTitle
                                           otherButtonTitles:
                                  [otherTitles objectAtIndex:0],
                                  [otherTitles objectAtIndex:1],
                                  [otherTitles objectAtIndex:2],
                                  [otherTitles objectAtIndex:3],
                                  [otherTitles objectAtIndex:4],
                                  [otherTitles objectAtIndex:5],
                                  [otherTitles objectAtIndex:6],
                                  [otherTitles objectAtIndex:7],
                                  [otherTitles objectAtIndex:8],
                                  [otherTitles objectAtIndex:9],
                                  [otherTitles objectAtIndex:10],
                                  [otherTitles objectAtIndex:11],
                                  [otherTitles objectAtIndex:12],
                                  [otherTitles objectAtIndex:13],
                                  [otherTitles objectAtIndex:14],
                                  [otherTitles objectAtIndex:15],
                                  [otherTitles objectAtIndex:16],
                                  [otherTitles objectAtIndex:17],
                                  [otherTitles objectAtIndex:18],
                                  [otherTitles objectAtIndex:19],
                                  [otherTitles objectAtIndex:20],
                                  [otherTitles objectAtIndex:21],
                                  [otherTitles objectAtIndex:22],
                                  [otherTitles objectAtIndex:23],
                                  [otherTitles objectAtIndex:24],
                                  [otherTitles objectAtIndex:25],
                                  [otherTitles objectAtIndex:26],
                                  [otherTitles objectAtIndex:27],
                                  [otherTitles objectAtIndex:28],
                                  [otherTitles objectAtIndex:29],nil];
    
    actionSheet.clickedButtonBlock = callback;
    
    [actionSheet showInView:inView];
    
    return actionSheet;
}



@end
