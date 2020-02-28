//
//  LLResponderVC.m
//  LLTest
//
//  Created by lijipeng on 2019/12/17.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLResponderVC.h"
#import "LLResponderAView.h"
#import "LLResponderBView.h"
#import "LLWhiteView.h"

@interface LLResponderVC ()

@end

@implementation LLResponderVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 查看hitTest如何调用
    LLResponderAView *a = [[LLResponderAView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    a.backgroundColor = [UIColor grayColor];
    [self.view addSubview:a];
    
    LLResponderBView *b = [[LLResponderBView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    b.backgroundColor = [UIColor lightGrayColor];
    [a addSubview:b];
    
    LLWhiteView *white= [[LLWhiteView alloc] initWithFrame:CGRectMake(0, 300, 200, 200)];
    white.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:white];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch---vc---");
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
