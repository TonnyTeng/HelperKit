//
//  UIActionSheet+HelperKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ActionSheetClickedButtonBlock)(UIActionSheet *actionSheet, NSUInteger buttonIndex);

@interface UIActionSheet (HelperKit)

/**
 *
 *	The action sheet callback block
 */
@property (nonatomic, copy) ActionSheetClickedButtonBlock clickedButtonBlock;

/**
 *
 *	Show an action sheet in the view with a title, cancel button title,
 *  destructive title and other button titles.
 *
 *	@param inView						Which view show the action sheet.
 *	@param title						The action sheet's title.
 *	@param cancelTitle			The cancel button's title.
 *	@param destructiveTitle	The destructive button title.
 *	@param otherTitles			Other buton titles.
 *	@param callback					The callback block
 *
 *	@return The UIActionSheet instance.
 */
+ (instancetype)showInView:(UIView *)inView
                     title:(NSString *)title
               cancelTitle:(NSString *)cancelTitle
          destructiveTitle:(NSString *)destructiveTitle
               otherTitles:(NSArray *)otherTitles
                  callback:(ActionSheetClickedButtonBlock)callback;

@end
