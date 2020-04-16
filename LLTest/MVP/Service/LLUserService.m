//
//  LLUserService.m
//  LLTest
//
//  Created by lijipeng on 2020/4/16.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLUserService.h"

@implementation LLUserService
- (void)getUserInfosSuccess:(SuccessHandler)success andFail:(FailHandler)fail {
    NSArray *result = @[@{@"name":@"Tom",
                          @"age":@25,
                          @"addr":@"GuangZhou",
                          @"gender":@"male",
                          },
                        @{@"name":@"Jerry",
                          @"age":@22,
                          @"addr":@"Hangzhou",
                          @"gender":@"male",
                          },
                        @{@"name":@"Lucy",
                          @"age":@25,
                          @"addr":@"Didu",
                          @"gender":@"female",
                          }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        success(@{@"data":result});
    });
}

@end
