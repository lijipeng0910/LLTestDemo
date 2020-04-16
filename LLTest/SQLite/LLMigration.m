//
//  LLMigration.m
//  DPDatabaseManager
//
//  Created by lijipeng on 2020/3/28.
//  Copyright © 2020 Andrew. All rights reserved.
//

#import "LLMigration.h"

@interface LLMigration()

@property(nonatomic,copy)NSString * myName;
@property(nonatomic,assign)uint64_t myVersion;
@property(nonatomic,strong)NSArray * updateArray;

@end

@implementation LLMigration

- (instancetype)initWithName:(NSString *)name andVersion:(uint64_t)version andExecuteUpdateArray:(NSArray *)updateArray
{
    if (self=[super init]) {
        _myName=name;
        _myVersion=version;
        _updateArray=updateArray;
    }
    return self;
}

- (NSString *)name
{
    return _myName;
}

- (uint64_t)version
{
    return _myVersion;
}

- (BOOL)migrateDatabase:(FMDatabase *)database error:(out NSError *__autoreleasing *)error
{
    for(NSString * updateStr in _updateArray)
    {
        [database executeUpdate:updateStr];
    }
    return YES;
}

@end
