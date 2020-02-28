//
//  LLSwizzlingVC.m
//  LLTest
//
//  Created by lijipeng on 2020/1/8.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLSwizzlingVC.h"
#import "UIButton+LLSwizzling.h"
@interface LLSwizzlingVC ()

@end

@implementation LLSwizzlingVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - runtime方法交换具体应用
    NSArray *arr = @[@"1",@"2"];
    [arr objectAtIndex:2];
    
    UIButton *instanceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    instanceBtn.frame = CGRectMake(100, 100, 200, 100);
    instanceBtn.backgroundColor = [UIColor lightGrayColor];
    [instanceBtn setTitle:@"防多次点击" forState:UIControlStateNormal];
    [instanceBtn addTarget:self action:@selector(instanceAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:instanceBtn];
    instanceBtn.acceptEventInterval = 3;
    // Do any additional setup after loading the view from its nib.
}

- (void)instanceAction:(UIButton *)sender
{
    NSLog(@"被点击");
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
