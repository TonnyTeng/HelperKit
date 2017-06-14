//
//  HelperKitBaseController.m
//  DTHelperKit
//
//  Created by dengtao on 2017/6/13.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "HelperKitBaseController.h"
#import <objc/runtime.h>
#import "HelperKit.h"

@interface HelperKitBaseController ()

@property (nonatomic, strong) NSMutableArray *notificationNames;
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;

@end

@implementation HelperKitBaseController

- (void)dealloc {
    [self removeAllNotifications];
    
#if DEBUG
    NSLog(@"%@ dealloc", [[self class] description]);
#endif
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"---------%s--------",__FUNCTION__);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = kWhiteColor;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
#if DEBUG
    NSLog(@"%@ viewDidAppear", [[self class] description]);
#endif
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
#if DEBUG
    NSLog(@"%@ viewDidDisappear", [[self class] description]);
#endif
}

- (UIButton *)leftButtonItem {
    return [[self leftButtonItems] objectAtIndex:0];
}

- (NSArray<UIButton *> *)leftButtonItems {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSArray *leftItems = self.navigationItem.leftBarButtonItems;
    for (UIBarButtonItem *item in leftItems) {
        if ([item isKindOfClass:[UIBarButtonItem class]]) {
            if ([item.customView isKindOfClass:[UIButton class]]) {
                [array addObject:item.customView];
            }
        }
    }
    return array;
}

- (UIButton *)rightButtonItem {
    return [[self rightButtonItems] objectAtIndex:0];
}

- (NSArray<UIButton *> *)rightButtonItems {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSArray *rightItems = self.navigationItem.rightBarButtonItems;
    for (UIBarButtonItem *item in rightItems) {
        if ([item isKindOfClass:[UIBarButtonItem class]]) {
            if ([item.customView isKindOfClass:[UIButton class]]) {
                [array addObject:item.customView];
            }
        }
    }
    
    return array;
}

- (void)adjustNavigationTitleToCenter {
    NSArray *viewControllerArray = [self.navigationController viewControllers];
    
    long previousViewControllerIndex = [viewControllerArray indexOfObject:self] - 1;
    UIViewController *previous;
    
    if (previousViewControllerIndex >= 0) {
        previous = [viewControllerArray objectAtIndex:previousViewControllerIndex];
        previous.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]
                                                     initWithTitle:@" "
                                                     style:UIBarButtonItemStylePlain
                                                     target:self
                                                     action:nil];
    }
}

- (void)setNavTitle:(id)title
             rightTitle:(NSString *)rightTitle
             rightBlock:(ButtonBlock)rightBlock {
    if (kIsEmptyString(rightTitle)) {
        return [self setNavTitle:title];
    }
    
    return [self setNavTitle:title rightTitles:@[rightTitle] rightBlock:^(NSUInteger index, UIButton *sender) {
        if (rightBlock) {
            rightBlock(sender);
        }
    }];
}

- (void)setNavTitle:(id)title
            rightTitles:(NSArray<NSString *> *)rightTitles
             rightBlock:(ButtonIndexBlock)rightBlock {
    [self setNavTitle:title];
    
    if (kIsArray(rightTitles) && rightTitles.count >= 1) {
        NSUInteger i = 0;
        NSMutableArray *rightButtons = [[NSMutableArray alloc] init];
        for (NSString *title in rightTitles) {
            UIButton *btn = [UIButton buttonWithTitle:title superView:nil constraints:nil touchUp:^(UIButton *sender) {
                if (rightBlock) {
                    rightBlock(i, sender);
                }
            }];
            
            [rightButtons addObject:btn];
            i++;
        }
        
        [self _setNavItems:rightButtons isLeft:NO];
    }
}

- (void)setNavTitle:(id)title
            rightImages:(NSArray *)rightImages
             rightBlock:(ButtonIndexBlock)rightBlock {
    return [self setNavTitle:title
                     rightImages:rightImages
                   rightHgImages:nil
                      rightBlock:rightBlock];
}

- (void)setNavTitle:(id)title
            rightImages:(NSArray *)rightImages
          rightHgImages:(NSArray *)rightHgImages
             rightBlock:(ButtonIndexBlock)rightBlock {
    [self setNavTitle:title];
    
    if (kIsArray(rightImages) && rightHgImages.count >= 1) {
        NSUInteger i = 0;
        NSMutableArray *rightButtons = [[NSMutableArray alloc] init];
        for (NSString *imgName in rightImages) {
            NSString *last = [rightHgImages objectAtIndex:i];
            
            UIButton *btn = [UIButton buttonWithImage:imgName superView:nil constraints:nil touchUp:^(UIButton *sender) {
                if (rightBlock) {
                    rightBlock(i, sender);
                }
            }];
            
            UIImage *hgImage = nil;
            if ([last isKindOfClass:[UIImage class]]) {
                hgImage = (UIImage *)last;
            } else if ([last isKindOfClass:[NSString class]]) {
                hgImage = kImage(last);
            }
            
            if (hgImage) {
                [btn setImage:hgImage forState:UIControlStateHighlighted];
            }
            
            [rightButtons addObject:btn];
            i++;
        }
        
        [self _setNavItems:rightButtons isLeft:NO];
    }
}

- (void)setNavLeftButtonTitle:(NSString *)title onCliked:(ButtonBlock)block {
    UIButton *btn = [UIButton buttonWithTitle:title
                                        superView:nil
                                      constraints:nil
                                          touchUp:block];
    
    [self _setNavItems:@[btn] isLeft:YES];
}

- (void)setNavLeftImage:(id)image block:(ButtonBlock)block {
    UIImage *normalImage = image;
    
    if ([normalImage isKindOfClass:[NSString class]]) {
        normalImage = kImage(image);
    }
    
    UIButton *btn = [UIButton buttonWithImage:image
                                        superView:nil
                                      constraints:nil
                                          touchUp:block];
    
    [self _setNavItems:@[btn] isLeft:YES];
}

- (void)setNavTitle:(id)title {
    if ([title isKindOfClass:[NSString class]]) {
        self.navigationItem.title = title;
    } else if ([title isKindOfClass:[UIView class]]) {
        self.navigationItem.titleView = title;
    } else if ([title isKindOfClass:[UIImage class]]) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:(UIImage *)title];
        self.navigationItem.titleView = imageView;
        [imageView sizeToFit];
    }
}

#pragma mark - Notification
- (void)addObserverWithNotificationName:(NSString *)notificationName
                                   callback:(NotificationBlock)callback {
    if (kIsEmptyString(notificationName)) {
        return;
    }
    
    [self addNotificationName:notificationName];
    
    [kNotificationCenter addObserver:self
                            selector:@selector(onRecievedNotification:)
                                name:notificationName
                              object:nil];
    objc_setAssociatedObject(self,
                             (__bridge const void *)(notificationName),
                             callback,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)removeAllNotifications {
    // 移除监听
    for (NSString *name in self.notificationNames) {
        [kNotificationCenter removeObserver:self name:name object:nil];
        // 取消关联
        objc_setAssociatedObject(self,
                                 (__bridge const void *)(name),
                                 nil,
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    [kNotificationCenter removeObserver:self];
}

- (void)removeAllNotificationWithName:(NSString *)nofiticationName {
    if (kIsEmptyString(nofiticationName)) {
        return;
    }
    
    // 移除监听
    for (NSString *name in self.notificationNames) {
        if ([name isEqualToString:nofiticationName]) {
            [kNotificationCenter removeObserver:self name:name object:nil];
            // 取消关联
            objc_setAssociatedObject(self,
                                     (__bridge const void *)(name),
                                     nil,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
            break;
        }
    }
}

- (UIActivityIndicatorView *)startIndicatorAnimating {
    return [self startIndicatorAnimatingWithStyle:UIActivityIndicatorViewStyleGray];
}

- (UIActivityIndicatorView *)startIndicatorAnimatingWithStyle:(UIActivityIndicatorViewStyle)style {
    if (self.loadingView == nil) {
        self.loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
        [self.view addSubview:self.loadingView];
        
        kWeakObject(self);
        if (self.navigationController && self.navigationController.navigationBarHidden == NO) {
            [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakObject.view);
                make.centerY.equalTo(weakObject.view).offset(-64 / 2);
            }];
        } else {
            [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(weakObject.view);
            }];
        }
    }
    
    [self.view bringSubviewToFront:self.loadingView];
    [self.loadingView startAnimating];
    
    return self.loadingView;
}

- (void)stopIndicatorAnimating {
    [self.loadingView stopAnimating];
    
    [self.loadingView removeFromSuperview];
    self.loadingView = nil;
}

#pragma mark - Private
- (void)_setNavItems:(NSArray *)buttons isLeft:(BOOL)isLeft {
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil
                                       action:nil];
    negativeSpacer.width = -8;
    if (kIOSVersion < 7) {
        negativeSpacer.width = 0;
    }
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:buttons.count];
    [items addObject:negativeSpacer];
    
    for (NSUInteger i = 0; i < buttons.count; ++i) {
        UIButton *btn = [buttons objectAtIndex:i];
        [btn sizeToFit];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
    }
    
    if (isLeft) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

- (void)addNotificationName:(NSString *)name {
    for (NSString *notificationName in self.notificationNames) {
        if ([notificationName isEqualToString:name]) {
            return;
        }
    }
    
    [self.notificationNames addObject:name];
}

- (void)onRecievedNotification:(NSNotification *)notification {
    for (NSString *name in self.notificationNames) {
        if ([name isEqualToString:notification.name]) {
            NotificationBlock block = objc_getAssociatedObject(self,
                                                                  (__bridge const void *)(notification.name));
            if (block) {
                block(notification);
            }
            
            break;
        }
    }
}

- (NSMutableArray *)notificationNames {
    if (_notificationNames == nil) {
        _notificationNames = [[NSMutableArray alloc] init];
    }
    
    return _notificationNames;
}


@end
