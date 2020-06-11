//
//  LLAbstractFactory.h
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLAbstractProduct.h"

typedef NS_ENUM(NSUInteger, LLFactoryType) {
    LLMeatType,
    LLFishType,
};

NS_ASSUME_NONNULL_BEGIN

@interface LLAbstractFactory : NSObject
+ (LLAbstractFactory *)factoryWithType:(LLFactoryType)type;
- (LLAbstractProduct *)createProduct;
@end

NS_ASSUME_NONNULL_END
