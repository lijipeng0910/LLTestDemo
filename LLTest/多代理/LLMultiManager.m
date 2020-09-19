//
//  LLMultiManager.m
//  LLTest
//
//  Created by lijipeng on 2020/6/21.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLMultiManager.h"

@interface LLMultiManager ()
@property (nonatomic, strong) NSPointerArray *delegates;
@end

@implementation LLMultiManager

+ (LLMultiManager *)shareManager
{
    static LLMultiManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [LLMultiManager new];
    });
    return manager;
}

- (void)ll_multiSendMessage
{
    for (NSUInteger i = 0; i < self.delegates.count; i += 1) {
        id delegate = (__bridge id)[self.delegates pointerAtIndex:i];
        if(delegate && [delegate respondsToSelector:@selector(ll_multiDoSomething)]) {
            [delegate ll_multiDoSomething];
        }
    }
}

- (void)ll_addDelegate:(id<LLMultiDelegate>)delegate
{
    [self.delegates addPointer:(__bridge void * _Nullable)(delegate)];
}

- (NSPointerArray *)delegates
{
    if (!_delegates) {
        _delegates = [NSPointerArray new];
    }
    return _delegates;
}

@end
