//
//  LLTimerVC.m
//  LLTest
//
//  Created by lijipeng on 2019/12/18.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLTimerVC.h"
#import "NSTimer+LLCycle.h"
#import "LLTempTarget.h"
#import "LLWeakProxy.h"

@interface LLTimerVC ()

@end

@implementation LLTimerVC
{
    NSTimer *ll_timer;
}

- (void)dealloc
{
    NSLog(@"timer---VC---dealloc");
    [ll_timer invalidate];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 测试NSTimer循环引用，如何解决（三种方式：category中间类、NSObject继承类、NSProxy继承类）
    /*
    __weak LLTimerVC *weakSelf = self;
    ll_timer = [NSTimer ll_ScheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        //NSLog(@"unRetainCycle---timer");
        __strong LLTimerVC *strongSelf = weakSelf;
        [strongSelf unRetainLog];
    }];
    [ll_timer fire];
     */
    
    /*
    ll_timer = [LLTempTarget ll_scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [ll_timer fire];
     */
    
    ll_timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[LLWeakProxy proxyWithTarget:self] selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [ll_timer fire];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)timerAction:(NSTimer *)timer
{
    NSLog(@"timer");
}

- (void)unRetainLog
{
    NSLog(@"unRetainLog");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
