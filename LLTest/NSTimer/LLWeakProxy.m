//
//  LLWeakProxy.m
//  LLTest
//
//  Created by lijipeng on 2020/3/10.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLWeakProxy.h"

@implementation LLWeakProxy
+ (instancetype)proxyWithTarget:(id)target
{
    return [[self alloc] initWithTarget:target];
}

- (instancetype)initWithTarget:(id)target
{
    _weakTarget = target;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.weakTarget methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    if ([self.weakTarget respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.weakTarget];
    }
}

@end
