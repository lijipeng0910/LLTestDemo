//
//  NSArray+LLSwizzling.m
//  LLTest
//
//  Created by lijipeng on 2020/1/8.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "NSArray+LLSwizzling.h"
#import <objc/runtime.h>

@implementation NSArray (LLSwizzling)

+ (void)load {
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(swizz_objectAtIndex:));
    method_exchangeImplementations(fromMethod, toMethod);
}

- (id)swizz_objectAtIndex:(NSUInteger)index {
    // 判断下标是否越界，如果越界就进入异常拦截
    if (self.count-1 < index) {
        @try {
            return [self swizz_objectAtIndex:index];
        }
        @catch (NSException *exception) {
            // 在崩溃后会打印崩溃信息。如果是线上，可以在这里将崩溃信息发送到服务器
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            NSLog(@"%@", [exception callStackSymbols]);
            return nil;
        }
        @finally {}
    } // 如果没有问题，则正常进行方法调用
    else {
        return [self swizz_objectAtIndex:index];
    }
}
@end
