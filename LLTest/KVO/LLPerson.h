//
//  LLPerson.h
//  LLTest
//
//  Created by lijipeng on 2020/2/29.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLPerson : NSObject
{
    NSInteger _age;
}
- (void)setAge:(NSInteger)age;
- (NSInteger)age;
@end

NS_ASSUME_NONNULL_END
