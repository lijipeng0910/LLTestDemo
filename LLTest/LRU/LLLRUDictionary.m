//
//  LLLRUDictionary.m
//  LLTest
//
//  Created by lijipeng on 2020/6/22.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLLRUDictionary.h"

@interface LLLRUDictionary ()

@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, strong) NSMutableArray *arrayForLRU;
@property (nonatomic, assign) NSUInteger maxCountLRU;

@end

@implementation LLLRUDictionary

- (instancetype)initWithMaxCountLRU:(NSUInteger)maxCountLRU
{
    self = [super init];
    if (self) {
        _dict = [[NSMutableDictionary alloc] initWithCapacity:maxCountLRU];
        _arrayForLRU = [[NSMutableArray alloc] initWithCapacity:maxCountLRU];
        _maxCountLRU = maxCountLRU;
    }
    return self;
}

#pragma mark - NSDictionary

- (NSUInteger)count
{
    return [_dict count];
}

- (NSEnumerator *)keyEnumerator
{
    return [_dict keyEnumerator];
}

#pragma mark - NSMutableDictionary - get

- (id)objectForKey:(id)aKey
{
    return [self objectForKey:aKey returnEliminateObjectUsingBlock:^id(BOOL maybeEliminate) {
        return nil;
    }];
}

- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(id, id, BOOL *))block
{
    [_dict enumerateKeysAndObjectsUsingBlock:block];
}

#pragma mark - NSMutableDictionary - set

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    BOOL isExist = ([_dict objectForKey:aKey] != nil);
    [_dict setObject:anObject forKey:aKey];
    
    if (isExist) {
        [self _adjustPositionLRU:aKey];
    } else {
        [self _addObjectLRU:aKey];
    }
}

- (void)removeAllObjects
{
    [_dict removeAllObjects];
    [_arrayForLRU removeAllObjects];
}

- (void)removeObjectsForKeys:(NSArray *)keyArray
{
    [_dict removeObjectsForKeys:keyArray];
    [_arrayForLRU removeObjectsInArray:keyArray];
}

- (void)removeObjectForKey:(id)aKey
{
    [_dict removeObjectForKey:aKey];
    [_arrayForLRU removeObject:aKey];
}

#pragma mark - LRUMutableDictionary

- (id)objectForKey:(id)aKey returnEliminateObjectUsingBlock:(id (^)(BOOL))block
{
    id object = [_dict objectForKey:aKey];
    if (object) {
        [self _adjustPositionLRU:aKey];
    }
    if (block) {
        BOOL maybeEliminate = object ? NO : YES;
        id newObject = block(maybeEliminate);
        if (newObject) {
            [self setObject:newObject forKey:aKey];
            return [_dict objectForKey:aKey];
        }
    }
    return object;
}

#pragma mark - LRU

- (void)_adjustPositionLRU:(id)anObject
{
    NSUInteger idx = [_arrayForLRU indexOfObject:anObject];
    if (idx != NSNotFound) {
        [_arrayForLRU removeObjectAtIndex:idx];
        [_arrayForLRU insertObject:anObject atIndex:0];
    }
}

- (void)_addObjectLRU:(id)anObject
{
    [_arrayForLRU insertObject:anObject atIndex:0];
    // 当超出LRU算法限制之后，将最不常使用的元素淘汰
    if ((_maxCountLRU > 0) && (_arrayForLRU.count > _maxCountLRU)) {
        [_dict removeObjectForKey:[_arrayForLRU lastObject]];
        [_arrayForLRU removeLastObject];
        
        // 【注意】这里不要直接调用下面这个方法，因为内部调用[_arrayForLRU removeObject:anObject];的时候，
        // 每次都将Array从头开始遍历到最后一个，这里既然已经知道是删除最后一个了，直接删除即可。
        // 使用下面这种方法会增加上百倍的耗时。
        // [self removeObjectForKey:[_arrayForLRU lastObject]];
    }
}

@end
