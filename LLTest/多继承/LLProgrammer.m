//
//  LLProgrammer.m
//  LLTest
//
//  Created by lijipeng on 2020/6/28.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLProgrammer.h"
#import "LLDrawer.h"
#import "LLSinger.h"

@implementation LLProgrammer
///  直接消息转发
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    LLDrawer *drawer = [LLDrawer new];
    if ([drawer respondsToSelector:aSelector]) {
        return drawer;
    }
    return nil;
}

///  标准消息转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    LLSinger *singer = [LLSinger new];
    if (!signature && [singer respondsToSelector:aSelector]) {
        signature = [singer methodSignatureForSelector:aSelector];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL sel = [anInvocation selector];
    LLSinger *singer = [LLSinger new];
    if ([singer respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:singer];
    }
}
@end
