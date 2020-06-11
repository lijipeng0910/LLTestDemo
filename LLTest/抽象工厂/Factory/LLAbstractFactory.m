//
//  LLAbstractFactory.m
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLAbstractFactory.h"
#import "LLAbstractProduct.h"
#import "LLMeatFactory.h"
#import "LLFishFactory.h"

@implementation LLAbstractFactory
+ (LLAbstractFactory *)factoryWithType:(LLFactoryType)type
{
    LLAbstractFactory *factory;
    switch (type) {
        case LLMeatType:
            factory = [[LLMeatFactory alloc] init];
            break;
        case LLFishType:
            factory = [[LLFishFactory alloc] init];
            break;
        default:
            break;
    }
    return factory;
}
- (LLAbstractProduct *)createProduct
{
    LLAbstractProduct *product = [LLAbstractProduct new];
    return product;
}
@end
