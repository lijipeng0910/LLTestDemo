//
//  LLResponderBView.m
//  LLTest
//
//  Created by lijipeng on 2019/12/17.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLResponderBView.h"

@implementation LLResponderBView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"touch b");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"hit b");
    NSLog(@"%@", NSStringFromClass([super class]));
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"view %p",view);
    if (view == self) {
        return nil;
    }
    return view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
