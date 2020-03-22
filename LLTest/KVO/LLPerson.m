//
//  LLPerson.m
//  LLTest
//
//  Created by lijipeng on 2020/2/29.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLPerson.h"

@interface LLPerson ()

@end

@implementation LLPerson

- (void)setAge:(NSInteger)age
{
    [self willChangeValueForKey:@"age"];
    _age = age;
    [self didChangeValueForKey:@"age"];
}

- (NSInteger)age
{
    return _age;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    if ([key isEqualToString:@"age"])
    {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}

@end
