//
//  LLSwizzlingVC+LL.m
//  LLTest
//
//  Created by lijipeng on 2020/6/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLSwizzlingVC+LL.h"
#import <objc/runtime.h>

@implementation LLSwizzlingVC (LL)
//load方法会在类第一次加载的时候被调用
//调用的时间比较靠前，适合在这个方法里做方法交换
+ (void)load{
    //方法交换应该被保证，在程序中只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //获得viewController的生命周期方法的selector
        SEL willSel = @selector(instanceAction:);
        //自己实现的将要被交换的方法的selector
        SEL swizzWillSel = @selector(swizz_instanceAction:);
        //两个方法的Method
        Method willMethod = class_getInstanceMethod([self class], willSel);
        Method swizzWillMethod = class_getInstanceMethod([self class], swizzWillSel);
        //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
        BOOL isAdd = class_addMethod(self, willSel, method_getImplementation(swizzWillMethod), method_getTypeEncoding(swizzWillMethod));
        if (isAdd) {
            //如果成功，说明类中不存在这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod(self, swizzWillSel, method_getImplementation(willMethod), method_getTypeEncoding(willMethod));
        }else{
            //否则，交换两个方法的实现
            method_exchangeImplementations(willMethod, swizzWillMethod);
        }
    });
}

- (void)swizz_instanceAction:(UIButton *)sender{
    //这时候调用自己，看起来像是死循环
    //但是其实自己的实现已经被替换了
    [self swizz_instanceAction:sender];
    NSLog(@"LLSwizzlingVC_swizzling---%@",NSStringFromClass([self class]));
}

@end
