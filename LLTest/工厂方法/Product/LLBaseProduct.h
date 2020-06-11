//
//  LLBaseProduct.h
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLBaseProduct : NSObject
@property (nonatomic, copy)NSString *name;
- (void)setProductName;
@end

NS_ASSUME_NONNULL_END
