//
//  HelperKitBaseNavController.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelperKitBaseNavController : UINavigationController

- (void)pushViewController:(UIViewController*)controller animatedWithTransition:(UIViewAnimationTransition)transition;

- (UIViewController *)popViewControllerAnimatedWithTransition:(UIViewAnimationTransition)transition;

@end
