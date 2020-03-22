//
//  LLLockVC.m
//  LLTest
//
//  Created by lijipeng on 2020/2/29.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLLockVC.h"
#define max(a,b)  (a>b?a:b)
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

    NSMutableArray *mArr = @[@"1"].mutableCopy;
    dispatch_queue_t queue = dispatch_queue_create("11", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i < 1000; i++) {
            NSLog(@"mArr = %@",mArr);
        }
    });
    dispatch_barrier_async(queue, ^{
        [mArr addObject:@"2"];
        NSLog(@"111mArr = %@",mArr);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
