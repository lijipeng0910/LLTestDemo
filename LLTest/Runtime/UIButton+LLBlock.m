//
//  UIButton+LLBlock.m
//  LLTest
//
//  Created by lijipeng on 2020/6/5.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "UIButton+LLBlock.h"
#import <objc/runtime.h>
static const char *key = "buttonAction";
@implementation UIButton (LLBlock)

// 添加点击事件
- (void)addAction:(LLButtonBlock)block {
    objc_setAssociatedObject(self, key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addAction:(LLButtonBlock)block forControlEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, key, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(action:) forControlEvents:controlEvents];
}

// 响应点击事件
- (void)action:(id)sender {
    LLButtonBlock blockAction = (LLButtonBlock)objc_getAssociatedObject(self, key);
    if (blockAction) {
        blockAction(self);
    }
}

@end
