//
//  LLThreadVC.m
//  LLTest
//
//  Created by lijipeng on 2020/1/3.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLThreadVC.h"

@interface LLThreadVC ()

@end

@implementation LLThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 测试多个异步任务完成后如何合并处理
    /*
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:1];//sleep(1);
        NSLog(@"线程1");
        dispatch_group_leave(group);
    });
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:2];//sleep(2);
        NSLog(@"线程2");
        dispatch_group_leave(group);
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"执行完成");
    });
     */
    
    /*
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        sleep(1);
        NSLog(@"线程1");
    });
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        NSLog(@"线程2");
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"执行完成");
    });
     */
    
    /*
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"线程1");
    });
    dispatch_async(queue, ^{
        sleep(2);
        NSLog(@"线程2");
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"执行完成");
    });
     */
    
    /*
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        sleep(1);
        NSLog(@"线程1");
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        sleep(2);
        NSLog(@"线程2");
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        sleep(3);
        NSLog(@"执行完成");
        dispatch_semaphore_signal(semaphore);
    });
     */
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(1);
        NSLog(@"线程1");
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(2);
        NSLog(@"线程2");
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        sleep(3);
        NSLog(@"执行完成");
    }];
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    NSOperationQueue *queue = [NSOperationQueue new];
    [queue addOperations:@[op1,op2,op3] waitUntilFinished:NO];
     
    // Do any additional setup after loading the view from its nib.
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
