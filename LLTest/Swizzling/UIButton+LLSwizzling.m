//
//  UIButton+LLSwizzling.m
//  LLTest
//
//  Created by lijipeng on 2020/1/8.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "UIButton+LLSwizzling.h"
#import "objc/runtime.h"

static const char *UIControl_acceptEventInterval="UIControl_acceptEventInterval";
static const char *UIControl_ignoreEvent="UIControl_ignoreEvent";

@interface UIButton ()
@property (nonatomic, assign) BOOL ignoreEvent;

@end

@implementation UIButton (LLSwizzling)

#pragma mark - acceptEventInterval
- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval
{
    objc_setAssociatedObject(self,UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)acceptEventInterval {
    return [objc_getAssociatedObject(self,UIControl_acceptEventInterval) doubleValue];
}

#pragma mark - ignoreEvent
- (void)setIgnoreEvent:(BOOL)ignoreEvent{
    objc_setAssociatedObject(self,UIControl_ignoreEvent, @(ignoreEvent), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)ignoreEvent{
    return [objc_getAssociatedObject(self,UIControl_ignoreEvent) boolValue];
}

#pragma mark - Swizzling
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selA = @selector(sendAction:to:forEvent:);
        SEL selB = @selector(swizzled_sendAction:to:forEvent:);
        Method methodA = class_getInstanceMethod(self,selA);
        Method methodB = class_getInstanceMethod(self,selB);
        //method_exchangeImplementations(methodA, methodB);

        BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
        if (isAdd) {
            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
            NSLog(@"replace");
        }else{
            method_exchangeImplementations(methodA, methodB);
            NSLog(@"exchange");
        }
    });
}

- (void)swizzled_sendAction:(SEL)action to:(id)target forEvent:(UIEvent*)event
{
    NSLog(@"UIButton---swizzled");
    if ([NSStringFromClass([self class]) isEqualToString:@"UIButton"]) {
        if(self.ignoreEvent){
            NSLog(@"btnAction is intercepted");
            return;
        } else if(self.acceptEventInterval>0){
            self.ignoreEvent=YES;
            [self performSelector:@selector(setIgnoreEventWithNo) withObject:nil afterDelay:self.acceptEventInterval];
        }
    }
    self.ignoreEvent=YES;
    [self swizzled_sendAction:action to:target forEvent:event];
}

- (void)setIgnoreEventWithNo{
    self.ignoreEvent=NO;
}

@end
