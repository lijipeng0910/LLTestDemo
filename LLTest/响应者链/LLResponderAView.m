//
//  LLResponderAView.m
//  LLTest
//
//  Created by lijipeng on 2019/12/17.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLResponderAView.h"

@implementation LLResponderAView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"touch a");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"hit a");
    // 1.判断下窗口能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES ||  self.alpha <= 0.01) return nil;
        // 2.判断下点在不在窗口上
        // 不在窗口上
        if ([self pointInside:point withEvent:event] == NO) return nil;
            // 3.从后往前遍历子控件数组
            int count = (int)self.subviews.count;
            for (int i = count - 1; i >= 0; i--) {
            // 获取子控件
            UIView *childView = self.subviews[i];
            // 坐标系的转换,把窗口上的点转换为子控件上的点
            // 把自己控件上的点转换成子控件上的点
            CGPoint childP = [self convertPoint:point toView:childView];
            UIView *fitView = [childView hitTest:childP withEvent:event];
            if (fitView) {
                // 如果能找到最合适的view
                return fitView;
            }
    }
    // 4.没有找到更合适的view，也就是没有比自己更合适的view
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
