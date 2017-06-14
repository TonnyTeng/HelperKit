//
//  UIControl+HelperBlocksKit.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonKit.h"

@interface UIControl (HelperBlocksKit)

@property (nonatomic, copy) ButtonBlock onTouchUp;

@property (nonatomic, copy) ButtonBlock onTouchDown;

@property (nonatomic, copy) ValueChangedBlock onValueChanged;

@property (nonatomic, copy) EditChangedBlock onEditChanged;


@end
