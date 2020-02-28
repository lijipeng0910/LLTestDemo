//
//  LLSingleManager.m
//  LLTest
//
//  Created by lijipeng on 2020/1/3.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLSingleManager.h"
static LLSingleManager *manager = nil;

@implementation LLSingleManager

+ (LLSingleManager *)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[super allocWithZone:NULL] init];
    });
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [LLSingleManager shareManager];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [LLSingleManager shareManager];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [LLSingleManager shareManager];
}

@end
