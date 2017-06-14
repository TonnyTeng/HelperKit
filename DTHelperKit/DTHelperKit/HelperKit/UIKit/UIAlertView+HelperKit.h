//
//  UIAlertView+HelperKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertClickedButtonBlock)(UIAlertView *alertView,
NSUInteger buttonIndex);

@interface UIAlertView (HelperKit)

/**
 *
 *	The action callback block
 */
@property (nonatomic, copy) AlertClickedButtonBlock  clickedButtonBlock;

/**
 *
 *	Show an alert view with a title, message and button titles.
 *
 *	@param title				Title
 *	@param message			The content message
 *	@param buttonTitles	The buttion titles array.
 *	@param block				The callbac when clicked.
 *
 *	@return The UIAlertView instance.
 */
+ (instancetype)showWithTitle:(NSString *)title
                      message:(NSString *)message
                 buttonTitles:(NSArray *)buttonTitles
                        block:(AlertClickedButtonBlock)block;

@end
