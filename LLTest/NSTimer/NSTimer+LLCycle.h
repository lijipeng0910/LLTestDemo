//
//  NSTimer+LLCycle.h
//  LLTest
//
//  Created by lijipeng on 2019/12/18.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (LLCycle)
+ (NSTimer *)ll_ScheduledTimerWithTimeInterval:(NSTimeInterval)inerval repeats:(BOOL)repeats block:(void(^)(NSTimer *timer))block;
@end

NS_ASSUME_NONNULL_END
