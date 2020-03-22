//
//  LLKey.h
//  LLTest
//
//  Created by lijipeng on 2020/3/17.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLKey : NSObject<NSCopying>

@property (nonatomic, copy) NSString *keyName;

- (instancetype)initWithKeyName:(NSString *)keyName;
@end

NS_ASSUME_NONNULL_END
