//
//  LLUserModel.m
//  LLTest
//
//  Created by lijipeng on 2020/4/16.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLUserModel.h"

@implementation LLUserModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)userWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
