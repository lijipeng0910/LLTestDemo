//
//  LLLayoutView.m
//  LLTest
//
//  Created by lijipeng on 2020/1/3.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLLayoutView.h"
#import "LLLayoutBView.h"

@implementation LLLayoutView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        LLLayoutBView *b = [[LLLayoutBView alloc] initWithFrame:CGRectZero];
        [self addSubview:b];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            b.frame = CGRectMake(100, 100, 100, 100);
        });
    }
    return self;
}

//单纯init不会调用，以下情况会调用
//addSubView
//父视图、子视图frame发生改变
//UIScrollView
//旋转
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"a_layout");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
