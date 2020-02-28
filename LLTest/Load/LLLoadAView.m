//
//  LLLoadAView.m
//  LLTest
//
//  Created by lijipeng on 2019/12/18.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLLoadAView.h"

@implementation LLLoadAView
+ (void)load
{
    NSLog(@"a_load");
}

+ (void)initialize
{
    NSLog(@"a_initialize");
}

+(void)share
{
    NSLog(@"a_share");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
