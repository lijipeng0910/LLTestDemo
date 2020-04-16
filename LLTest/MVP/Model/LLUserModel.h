//
//  LLUserModel.h
//  LLTest
//
//  Created by lijipeng on 2020/4/16.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLUserModel : NSObject
@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSNumber *age;

@property (nonatomic, strong) NSString *addr;

@property (nonatomic, strong) NSString *gender;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)userWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
