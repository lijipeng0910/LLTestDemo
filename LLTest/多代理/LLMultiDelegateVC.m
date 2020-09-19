//
//  LLMultiDelegateVC.m
//  LLTest
//
//  Created by lijipeng on 2020/6/21.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLMultiDelegateVC.h"
#import "LLMultiManager.h"

@interface LLMultiDelegateVC ()<LLMultiDelegate>

@end

@implementation LLMultiDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[LLMultiManager shareManager] ll_addDelegate:self];
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - LLMultiDelegate
- (void)ll_multiDoSomething
{
    NSLog(@"多代理---2");
}

#pragma mark - 触发代理
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[LLMultiManager shareManager] ll_multiSendMessage];
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
