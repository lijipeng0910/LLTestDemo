//
//  LLModel.h
//  LLTest
//
//  Created by lijipeng on 2020/4/2.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLModel : NSObject
@property (nonatomic, copy) NSString *userName;

@property (nonatomic, assign) NSUInteger userAge;

@property (nonatomic, assign) BOOL isAdult;
@end

NS_ASSUME_NONNULL_END
