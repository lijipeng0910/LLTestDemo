//
//  LLTempTarget.m
//  LLTest
//
//  Created by lijipeng on 2020/3/10.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLTempTarget.h"

@implementation LLTempTarget
+ (NSTimer *)ll_scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats;
{
    LLTempTarget *tempTarget = [LLTempTarget new];
    tempTarget.selector = selector;
    tempTarget.weakTarget = target;
    tempTarget.weakTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:tempTarget selector:@selector(timerSelector:) userInfo:userInfo repeats:repeats];
    return tempTarget.weakTimer;
}

- (void)timerSelector:(NSTimer *)timer {
    if (self.weakTarget && [self.weakTarget respondsToSelector:self.selector]) {
        [self.weakTarget performSelector:self.selector withObject:timer.userInfo];
    } else {
        [self.weakTimer invalidate];
    }
}

- (void)dealloc
{
    NSLog(@"LLTempTarget---dealloc");
}
@end
