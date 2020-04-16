//
//  LLPresenter.h
//  LLTest
//
//  Created by lijipeng on 2020/4/16.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLUserProtocol.h"
#import "LLUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLPresenter : NSObject
/**
 将一个实现了 UserViewProtocol 协议的对象绑定到 presenter上来

 @param view 实现了UserViewProtocol的对象，一般来说，应该就是控制器，在MVP中，V 和 VC 共同组成UI 层
 */
- (void)attachView:(id <LLUserProtocol>)view;

/**
 这个是对外的入口，通过这个入口，实现多个对内部的操作，外部只要调用这个接口就可以了
 */
- (void)fetchData;

@end

NS_ASSUME_NONNULL_END
