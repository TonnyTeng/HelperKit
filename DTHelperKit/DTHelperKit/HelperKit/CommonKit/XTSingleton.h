//
//  XTSingleton.h
//  DTHelperKit
//
//  Created by dengtao on 2017/6/14.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <Foundation/Foundation.h>

#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ \
__singleton__ = [[__class alloc] init]; \
} ); \
return __singleton__; \
}

