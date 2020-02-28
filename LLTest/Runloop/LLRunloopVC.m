//
//  LLRunloopVC.m
//  LLTest
//
//  Created by lijipeng on 2020/1/7.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLRunloopVC.h"

@interface LLRunloopVC ()

@end

@implementation LLRunloopVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - runLoop具体应用
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self performSelector:@selector(delayAction) withObject:self afterDelay:3];
        //[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    });
#pragma mark - 苹果使用RunLoop实现的功能（AutoreleasePool、事件响应、手势识别、界面更新、NSTimer、PerformSelecter、GCD、网络请求）
    // Do any additional setup after loading the view from its nib.
}

- (void)delayAction
{
    NSLog(@"delay");
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
