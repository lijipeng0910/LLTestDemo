//
//  LLUserProtocol.h
//  LLTest
//
//  Created by lijipeng on 2020/4/16.
//  Copyright © 2020 lijipeng. All rights reserved.
//

/**
* UserViewProtocol 协议定义了一下方法，这些方法其实就是presenter对view层发送的命令
*/

#import <Foundation/Foundation.h>
#import "LLUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LLUserProtocol <NSObject>
- (void)userViewDataSource:(NSArray<LLUserModel *> *)data;

- (void)showIndicator;

- (void)hideIndicator;

- (void)showEmptyView;

@end

NS_ASSUME_NONNULL_END
