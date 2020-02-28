//
//  UIButton+LLSwizzling.h
//  LLTest
//
//  Created by lijipeng on 2020/1/8.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LLSwizzling)
@property (nonatomic, assign) NSTimeInterval acceptEventInterval;
@end

NS_ASSUME_NONNULL_END
