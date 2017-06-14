//
//  ViewController.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "ViewController.h"
#import "HelperKit.h"
#import "DTTimeLineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    DTTimeLineView *timeLineView = [[DTTimeLineView alloc] initWithFrame:CGRectMake(30, 50, kScreenWidth - 60, kScreenHeight - 100)];
    [self.view addSubview:timeLineView];
    
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 100; i ++) {
        
        DPTimeLineItem *item = [[DPTimeLineItem alloc] init];
        item.curr_time = [self getTimeWithNumber:i];
        
        item.pre_close_px = [NSString stringWithFormat:@"%d",50 + arc4random() % 10];
        item.last_px = [NSString stringWithFormat:@"%d",50 + arc4random() % 10];;
        
        [array addObject:item];
    }
    timeLineView.dataArrM = array;
}

- (NSString *)getTimeWithNumber:(NSInteger)number{

    NSInteger second = 10 * 60 + number;
    
    return [NSString stringWithFormat:@"%ld:%ld",second / 60,second % 60];
    
}



@end
