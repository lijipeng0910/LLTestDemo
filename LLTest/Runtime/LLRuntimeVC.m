//
//  LLRuntimeVC.m
//  LLTest
//
//  Created by lijipeng on 2020/1/7.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLRuntimeVC.h"
#import <objc/runtime.h>
#import "LLForwarding.h"

@interface LLRuntimeVC ()
#pragma mark - resolveInstanceMethod
- (void)unKnowSel_obj;
+ (void)unKnowSel_class;

#pragma mark - forwardingTargetForSelector
- (void)unKnowForwarding_obj;

#pragma mark - methodSignatureForSelector
- (void)unKnowSignature_obj;

@end

@implementation LLRuntimeVC
- (void)noObjMethod{
    NSLog(@"未实现这个实例方法");
}
+ (void)noClassMethod{
    NSLog(@"未实现这个类方法");
}

// 当一个对象调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传过来.
//注意:实例方法是存在于当前对象对应的类的方法列表中
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if ([NSStringFromSelector(sel) isEqualToString:@"unKnowSel_obj"]) {
        SEL aSel = NSSelectorFromString(@"noObjMethod");
        Method aMethod = class_getInstanceMethod(self, aSel);
        class_addMethod(self, sel, method_getImplementation(aMethod), "v@:");
    }
    return YES;
}
// 当一个类调用未实现的方法，会调用这个方法处理,并且会把对应的方法列表传过来.
//注意:类方法是存在于类的元类的方法列表中
+ (BOOL)resolveClassMethod:(SEL)sel{
    if ([NSStringFromSelector(sel) isEqualToString:@"unKnowSel_class"]) {
        SEL aSel = NSSelectorFromString(@"noClassMethod");
        Method aMethod = class_getClassMethod(self, aSel);
        class_addMethod(object_getClass(self), sel, method_getImplementation(aMethod), "v@:");
    }
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return [LLForwarding new];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"unKnowSignature_obj"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:[LLForwarding new]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - resolveInstanceMethod、resolveClassMethod拦截调用
    [self unKnowSel_obj];
    [LLRuntimeVC unKnowSel_class];
    
#pragma mark - forwardingTargetForSelector拦截调用
    [self unKnowForwarding_obj];
    
#pragma mark - methodSignatureForSelector拦截调用
    [self unKnowSignature_obj];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
