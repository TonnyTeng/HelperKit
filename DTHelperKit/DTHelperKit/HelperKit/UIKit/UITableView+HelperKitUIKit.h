//
//  UITableView+HelperKitUIKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (HelperKitUIKit)


+ (instancetype)tableViewWithSuperview:(UIView *)superView;



+ (instancetype)tableViewWithSuperview:(UIView *)superView delegate:(id)delegate;




+ (instancetype)tableViewWithSuperview:(UIView *)superView
                                  delegate:(id)delegate
                                     style:(UITableViewStyle)style;

@end
