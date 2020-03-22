//
//  LLBlockView.m
//  LLTest
//
//  Created by lijipeng on 2020/1/3.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLBlockView.h"

@implementation LLBlockView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self delayTest];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.myBlock) {
        self.myBlock();
    }
}

- (void)delayTest
{
    __weak typeof(self) weakSelf = self;
    self.myBlock = ^{
        //NSLog(@"weakSelf retainCount %ld",[weakSelf retainCount]);

        __strong typeof(weakSelf) strongSelf = weakSelf;
        //NSLog(@"strongSelf retainCount %ld",[strongSelf retainCount]);

         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [strongSelf log];
        });
    };
}

- (void)log {
    NSLog(@"run person log.....");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
