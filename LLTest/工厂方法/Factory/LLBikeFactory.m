//
//  LLBikeFactory.m
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLBikeFactory.h"
#import "LLBikeProduct.h"

@implementation LLBikeFactory
+ (LLBaseProduct *)createProduct
{
    LLBikeProduct *bike = [LLBikeProduct new];
    return bike;
}
@end
