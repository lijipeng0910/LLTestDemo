//
//  NSObject+LLModel.h
//  LLTest
//
//  Created by lijipeng on 2020/6/4.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LLModel)
+ (instancetype)modelWithDict:(NSDictionary *)dict;
+ (NSDictionary *)arrayContainModelClass;
@end

NS_ASSUME_NONNULL_END
