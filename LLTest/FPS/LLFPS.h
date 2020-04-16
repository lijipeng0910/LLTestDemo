//
//  LLFPS.h
//  LLTest
//
//  Created by lijipeng on 2020/4/7.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLFPS : NSObject
/**
 单例对象
 */
+ (LLFPS *)sharedFPSIndicator;

/**
 开始监测
 */
- (void)startMonitoring;

/**
 暂停监测
 */
- (void)pauseMonitoring;

/**
 移除监测
 */
- (void)removeMonitoring;
@end

NS_ASSUME_NONNULL_END
