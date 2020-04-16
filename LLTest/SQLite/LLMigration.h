//
//  LLMigration.h
//  DPDatabaseManager
//
//  Created by lijipeng on 2020/3/28.
//  Copyright © 2020 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDBMigrationManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLMigration : NSObject<FMDBMigrating>

- (instancetype)initWithName:(NSString *)name andVersion:(uint64_t)version andExecuteUpdateArray:(NSArray *)updateArray;//自定义方法

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) uint64_t version;
- (BOOL)migrateDatabase:(FMDatabase *)database error:(out NSError *__autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
