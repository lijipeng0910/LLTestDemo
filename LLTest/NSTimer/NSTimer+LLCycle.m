//
//  NSTimer+LLCycle.m
//  LLTest
//
//  Created by lijipeng on 2019/12/18.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "NSTimer+LLCycle.h"

@implementation NSTimer (LLCycle)
+ (NSTimer *)ll_ScheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                       repeats:(BOOL)repeats
                                         block:(void(^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:inerval target:self selector:@selector(blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)blockInvoke:(NSTimer *)timer {
    void (^block)(NSTimer *timer) = timer.userInfo;
    if (block) {
        block(timer);
    }
}
@end
