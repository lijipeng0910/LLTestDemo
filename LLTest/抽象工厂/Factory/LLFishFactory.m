//
//  LLFishFactory.m
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLFishFactory.h"
#import "LLFishProduct.h"

@implementation LLFishFactory
- (LLAbstractProduct *)createProduct
{
    LLFishProduct *fish = [LLFishProduct new];
    return fish;
}
@end
