//
//  LLAsyncLabel.h
//  LLTest
//
//  Created by lijipeng on 2020/4/8.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLAsyncLabel : UIView
//设置文字内容
@property(nonatomic, copy) NSString *text;
//设置字体
@property(nonatomic, strong) UIFont *font;

@end

NS_ASSUME_NONNULL_END
