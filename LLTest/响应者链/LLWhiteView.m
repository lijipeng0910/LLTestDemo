//
//  LLWhiteView.m
//  LLTest
//
//  Created by lijipeng on 2020/1/14.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLWhiteView.h"
#import "LLRedView.h"
#import "LLGreenView.h"

@implementation LLWhiteView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        LLRedView *red = [[LLRedView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        red.backgroundColor = [UIColor redColor];
        [self addSubview:red];
        
        LLGreenView *green = [[LLGreenView alloc] initWithFrame:CGRectMake(100, 0, 200, 100)];
        green.backgroundColor = [UIColor greenColor];
        [self addSubview:green];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"white---touch");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //return self.subviews[0];
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
        if (hitTestView) {
            return hitTestView;
        }
    }
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
