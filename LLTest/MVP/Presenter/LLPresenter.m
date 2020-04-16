//
//  LLPresenter.m
//  LLTest
//
//  Created by lijipeng on 2020/4/16.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLPresenter.h"
#import "LLUserService.h"

@interface LLPresenter()

@property (nonatomic,strong) LLUserService *userService;

@property (nonatomic, weak) id<LLUserProtocol> attachView;

@end

@implementation LLPresenter
- (void)attachView:(id<LLUserProtocol>)view {
    self.attachView = view;
    self.userService  = [[LLUserService alloc] init];
}

- (void)fetchData {
    [self getUserDatas];
}

- (void)getUserDatas {
    [self.attachView showIndicator];
    [_userService getUserInfosSuccess:^(NSDictionary *dic) {
        [self.attachView hideIndicator];
        NSArray *userArr = [dic valueForKey:@"data"];
        
        if ([self processOriginDataToUIFriendlyData:userArr].count == 0) {
            [self.attachView showEmptyView];
        }
        [self.attachView userViewDataSource:[self processOriginDataToUIFriendlyData:userArr]];
    } andFail:^(NSDictionary *dic) {
        
    }];
}

/**
 如果数据比较复杂，或者UI渲染的数据只是其中很少一部分，将原数据处理，输出成UI渲染的数据。（题外话：这里其实还可以使用协议，提供不同的数据格式输出。）

 @param originData 原始数据
 @return 将原始数据转换为UI需要数据
 */
- (NSArray<LLUserModel *> *)processOriginDataToUIFriendlyData:(NSArray *)originData {
    NSMutableArray<LLUserModel *> *friendlyUIData = [NSMutableArray array];
    for (NSDictionary *dic in originData) {
        if ([[dic valueForKey:@"gender"] isEqualToString:@"male"]) {
            LLUserModel *model = [LLUserModel userWithDict:dic];
            [friendlyUIData addObject:model];
        }
    }
    return friendlyUIData;
}

@end
