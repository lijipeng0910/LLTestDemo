//
//  LLMeatFactory.m
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLMeatFactory.h"
#import "LLMeatProduct.h"

@implementation LLMeatFactory
- (LLAbstractProduct *)createProduct
{
    LLMeatProduct *meat = [LLMeatProduct new];
    return meat;
}
@end
