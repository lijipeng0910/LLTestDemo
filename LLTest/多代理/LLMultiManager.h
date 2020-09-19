//
//  LLMultiManager.h
//  LLTest
//
//  Created by lijipeng on 2020/6/21.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LLMultiDelegate <NSObject>

- (void)ll_multiDoSomething;

@end

NS_ASSUME_NONNULL_BEGIN

@interface LLMultiManager : NSObject
- (void)ll_addDelegate:(id<LLMultiDelegate>)delegate;
- (void)ll_multiSendMessage;
+ (LLMultiManager *)shareManager;
@end

NS_ASSUME_NONNULL_END
