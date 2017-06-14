//
//  UITableView+HelperKitUIKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UITableView+HelperKitUIKit.h"

@implementation UITableView (HelperKitUIKit)

+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView {
    return [self hyb_tableViewWithSuperview:superView delegate:nil];
}


+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView delegate:(id)delegate {
    return [self hyb_tableViewWithSuperview:superView
                                   delegate:delegate];
}


+ (instancetype)hyb_tableViewWithSuperview:(UIView *)superView
                                  delegate:(id)delegate
                                     style:(UITableViewStyle)style{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [superView addSubview:tableView];
    
   
    
    return tableView;
}

@end
