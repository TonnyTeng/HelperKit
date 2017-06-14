//
//  UICollectionView+HelperKitUIKit.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "UICollectionView+HelperKitUIKit.h"

@implementation UICollectionView (HelperKitUIKit)

+ (instancetype)collectionViewWithDelegate:(id)delegate
                                    horizontal:(BOOL)isHorizontal
                                     superView:(UIView *)superView {
    return [self collectionViewWithDelegate:delegate
                                     horizontal:isHorizontal
                                           size:CGSizeZero
                                    itemSpacing:0
                                    lineSpacing:0
                                      superView:superView];
}

+ (instancetype)collectionViewWithDelegate:(id)delegate
                                    horizontal:(BOOL)isHorizontal
                                          size:(CGSize)itemSize
                                     superView:(UIView *)superView {
    return [self collectionViewWithDelegate:delegate
                                     horizontal:isHorizontal
                                           size:itemSize
                                    itemSpacing:0
                                    lineSpacing:0
                                      superView:superView];
}


+ (instancetype)collectionViewWithDelegate:(id)delegate
                                    horizontal:(BOOL)isHorizontal
                                          size:(CGSize)itemSize
                                   itemSpacing:(CGFloat)minimumInteritemSpacing
                                   lineSpacing:(CGFloat)minimumLineSpacing
                                     superView:(UIView *)superView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = itemSize;
    layout.minimumInteritemSpacing = minimumInteritemSpacing;
    layout.minimumLineSpacing = minimumLineSpacing;
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collection.backgroundColor = [UIColor whiteColor];
    collection.pagingEnabled = YES;
    collection.delegate = delegate;
    collection.dataSource = delegate;
    collection.showsHorizontalScrollIndicator = NO;
    [superView addSubview:collection];
    
    if (isHorizontal) {
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        collection.showsVerticalScrollIndicator = NO;
        collection.showsHorizontalScrollIndicator = YES;
    } else {
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        collection.showsVerticalScrollIndicator = YES;
        collection.showsHorizontalScrollIndicator = NO;
    }

    
    return collection;
}

@end
