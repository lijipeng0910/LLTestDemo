//
//  LLTempTarget.h
//  LLTest
//
//  Created by lijipeng on 2020/3/10.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLTempTarget : NSObject
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *weakTimer;
@property (nonatomic, weak) id weakTarget;
+ (NSTimer *)ll_scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
