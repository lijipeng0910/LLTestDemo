//
//  LLLockVC.m
//  LLTest
//
//  Created by lijipeng on 2020/2/29.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLLockVC.h"

@interface LLLockVC ()
@property (nonatomic, strong) NSMutableArray *mArr;
@end

@implementation LLLockVC
{
    NSTimer *firstT;
    NSTimer *secondT;
}

- (NSMutableArray *)mArr
{
    if (!_mArr) {
        _mArr = [NSMutableArray array];
    }
    return _mArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 同时开启多个timer对可变数组进行操作，需不需要加锁？
    /*
    firstT = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [firstT fire];

    secondT = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [secondT fire];
     */
    
    /*
    dispatch_queue_t queue = dispatch_queue_create("11", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10000; i++) {
            [self addAction];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10000; i++) {
            [self addAction];
        }
    });
     */
    
    /*
    // dispatch_semaphore加锁
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);// 如果改为1，理解wait的作用
         
    __block int j = 0;
    dispatch_async(queue, ^{
         j = 100;
         dispatch_semaphore_signal(semaphore);
    });
         
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"finish j = %d", j);
     */
    
    // NSLock加锁
    NSLock *lock = [[NSLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [lock lock];
        //[lock lockBeforeDate:[NSDate date]];
        NSLog(@"需要线程同步的操作1 开始");
        sleep(2);
        NSLog(@"需要线程同步的操作1 结束");
        [lock unlock];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        if ([lock tryLock]) {//尝试获取锁，如果获取不到返回NO，不会阻塞该线程
            NSLog(@"锁可用的操作");
            [lock unlock];
        }else{
            NSLog(@"锁不可用的操作");
        }
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:3];
        if ([lock lockBeforeDate:date]) {//尝试在未来的3s内获取锁，并阻塞该线程，如果3s内获取不到恢复线程, 返回NO,不会阻塞该线程
            NSLog(@"没有超时，获得锁");
            [lock unlock];
        }else{
            NSLog(@"超时，没有获得锁");
        }
    });

    // Do any additional setup after loading the view from its nib.
}

- (void)timerAction:(NSTimer *)timer
{
    if (timer==firstT) {
        [self.mArr addObject:@"1"];
        NSLog(@"first %@", _mArr);
    } else {
        [self.mArr addObject:@"2"];
        NSLog(@"second %@", _mArr);
    }
}

- (void)addAction
{
    static int i = 0;
    i++;
    NSLog(@"%d",i);
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
