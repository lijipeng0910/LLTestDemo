//
//  LLBaseFactory.h
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLBaseProduct.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLBaseFactory : NSObject
+ (LLBaseProduct *)createProduct;
@end

NS_ASSUME_NONNULL_END
