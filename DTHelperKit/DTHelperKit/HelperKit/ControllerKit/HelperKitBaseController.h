//
//  HelperKitBaseController.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonKit.h"

@interface HelperKitBaseController : UIViewController


@property (nonatomic, strong, readonly) UIButton *leftButtonItem;


@property (nonatomic, strong, readonly) NSArray<UIButton *> *leftButtonItems;

@property (nonatomic, strong, readonly) UIButton *rightButtonItem;


@property (nonatomic, strong, readonly) NSArray<UIButton *> *rightButtonItems;


- (void)adjustNavigationTitleToCenter;

#pragma mark - Config Navigaiton Item

- (void)setNavTitle:(id)title;

- (void)setNavTitle:(id)title
             rightTitle:(NSString *)rightTitle
             rightBlock:(ButtonBlock)rightBlock;


- (void)setNavTitle:(id)title
            rightTitles:(NSArray<NSString *> *)rightTitles
             rightBlock:(ButtonIndexBlock)rightBlock;


- (void)setNavTitle:(id)title
            rightImages:(NSArray *)rightImages
             rightBlock:(ButtonIndexBlock)rightBlock;


- (void)setNavTitle:(id)title
            rightImages:(NSArray *)rightImages
          rightHgImages:(NSArray *)rightHgImages
             rightBlock:(ButtonIndexBlock)rightBlock;


- (void)setNavLeftButtonTitle:(NSString *)title onCliked:(ButtonBlock)block;


- (void)setNavLeftImage:(id)image block:(ButtonBlock)block;

#pragma mark - About indicator animating

- (UIActivityIndicatorView *)startIndicatorAnimating;


- (UIActivityIndicatorView *)startIndicatorAnimatingWithStyle:(UIActivityIndicatorViewStyle)style;

- (void)stopIndicatorAnimating;

#pragma mark - Notification

- (void)addObserverWithNotificationName:(NSString *)notificationName
                                   callback:(NotificationBlock)callback;

- (void)removeAllNotifications;

- (void)removeAllNotificationWithName:(NSString *)nofiticationName;


@end
