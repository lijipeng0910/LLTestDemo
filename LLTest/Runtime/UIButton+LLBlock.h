//
//  UIButton+LLBlock.h
//  LLTest
//
//  Created by lijipeng on 2020/6/5.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LLButtonBlock)(UIButton *btn);

@interface UIButton (LLBlock)

// 添加点击事件
- (void)addAction:(LLButtonBlock)block;

- (void)addAction:(LLButtonBlock)block forControlEvents:(UIControlEvents)controlEvents;

@end

NS_ASSUME_NONNULL_END
