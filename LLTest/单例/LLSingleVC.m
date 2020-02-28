//
//  LLSingleVC.m
//  LLTest
//
//  Created by lijipeng on 2020/1/3.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLSingleVC.h"
#import "LLSingleManager.h"

@interface LLSingleVC ()

@end

@implementation LLSingleVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 创建安全的单例
    LLSingleManager *a = [LLSingleManager shareManager];
    LLSingleManager *b = [LLSingleManager new];
    NSLog(@"a,b地址是否一样，a---%p,b---%p",a,b);
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
