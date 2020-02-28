//
//  LLSingleManager.h
//  LLTest
//
//  Created by lijipeng on 2020/1/3.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLSingleManager : NSObject<NSCopying, NSMutableCopying>

+ (LLSingleManager *)shareManager;

@end

NS_ASSUME_NONNULL_END
