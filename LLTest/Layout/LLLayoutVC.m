//
//  LLLayoutVC.m
//  LLTest
//
//  Created by lijipeng on 2020/1/3.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLLayoutVC.h"
#import "LLLayoutView.h"

@interface LLLayoutVC ()

@end

@implementation LLLayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 测试layoutSubViews调用时机，大概有几类情况
    LLLayoutView *a = [[LLLayoutView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:a];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        a.frame = CGRectMake(100, 100, 100, 100);
    });
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
