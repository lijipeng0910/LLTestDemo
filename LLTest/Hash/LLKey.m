//
//  LLKey.m
//  LLTest
//
//  Created by lijipeng on 2020/3/17.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLKey.h"

@implementation LLKey
- (instancetype)initWithKeyName:(NSString *)keyName {
    if (self = [super init]) {
       _keyName = keyName;
    }
    return self;
}

- (NSUInteger)hash {
    NSLog(@"hash func");
    return [super hash];
}

- (BOOL)isEqual:(id)object {
    NSLog(@"isEqual func %p===%p",self,object);
    return [super isEqual:object];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    NSLog(@"copy funcr");
    LLKey *key = [[LLKey alloc] initWithKeyName:self.keyName];
    NSLog(@"copy is %p", key);
    return key;
}
@end
