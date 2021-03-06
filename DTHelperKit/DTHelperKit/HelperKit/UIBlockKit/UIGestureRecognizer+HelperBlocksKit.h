//
//  UIGestureRecognizer+HelperBlocksKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonKit.h"

@interface UIGestureRecognizer (HelperBlocksKit)


@property (nonatomic, copy) GestureBlock onGesture;


@property (nonatomic, copy) TapGestureBlock onTaped;


@property (nonatomic, copy) LongGestureBlock onLongPressed;

@end
