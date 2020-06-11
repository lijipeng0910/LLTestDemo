//
//  LLBaseFactory.m
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLBaseFactory.h"
#import "LLBaseProduct.h"

@implementation LLBaseFactory
+ (LLBaseProduct *)createProduct
{
    LLBaseProduct *product = [LLBaseProduct new];
    return product;
}
@end
