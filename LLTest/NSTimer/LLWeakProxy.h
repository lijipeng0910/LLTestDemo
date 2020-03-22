//
//  LLWeakProxy.h
//  LLTest
//
//  Created by lijipeng on 2020/3/10.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLWeakProxy : NSProxy
@property (nonatomic, weak) id weakTarget;
+ (instancetype)proxyWithTarget:(id)target;
- (instancetype)initWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
