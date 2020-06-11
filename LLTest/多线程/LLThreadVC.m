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
    
    /*
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
     */
    
#pragma mark - 线程死锁
    /*
    NSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
     */
    
    /*
    dispatch_queue_t serialQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
        NSLog(@"begin");
        dispatch_sync(serialQueue, ^{
            NSLog(@"middle");
        });
        NSLog(@"end");
    });
    // 函数会返回，不影响主线程
    NSLog(@"return");
     */
    
    /*
    dispatch_queue_t serialQueue = dispatch_queue_create("serial_queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"1");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"%@",[NSThread currentThread]);
            NSLog(@"2");
        });
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"3");
    });
    dispatch_async(serialQueue, ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"4");
        });
        NSLog(@"5");
    });
     */

#pragma mark - 根据上面的代码，可以看出有关dispatch的对象并不是OC对象，那么，用不用像对待CoreFoundation框架的对象一样，使用retain/release来管理呢？答案是不用的！如果是ARC环境，我们无需管理，会像对待OC对象一样自动内存管理。如果是MRC环境，不是使用retain/release，而是使用dispatch_retain/dispatch_release来管理

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
