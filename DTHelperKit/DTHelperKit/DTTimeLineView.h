//
//  DTTimeLineView.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPTimeLineItem : NSObject

@property (nonatomic, copy) NSString *pre_close_px;//昨日收盘价
@property (nonatomic, copy) NSString *last_px;//实时价格
@property (nonatomic, copy) NSString *curr_time;//当前时间
@end




@interface DTTimeLineView : UIView

/**分时数据列表*/
@property (nonatomic, strong)NSMutableArray *dataArrM;

@end
