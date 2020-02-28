//
//  LLLoadBView.m
//  LLTest
//
//  Created by lijipeng on 2019/12/18.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLLoadBView.h"

@implementation LLLoadBView
+ (void)load
{
    NSLog(@"b_load");
}

+ (void)initialize
{
    NSLog(@"b_initialize");
}

+(void)share
{
    NSLog(@"b_share");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
