//
//  LLCarFactory.m
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLCarFactory.h"
#import "LLCarProduct.h"

@implementation LLCarFactory
+ (LLBaseProduct *)createProduct
{
    LLCarProduct *car = [LLCarProduct new];
    return car;
}
@end
