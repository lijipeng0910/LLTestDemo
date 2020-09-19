//
//  LLSwizzlingTempVC.m
//  LLTest
//
//  Created by lijipeng on 2020/6/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLSwizzlingTempVC.h"

@interface LLSwizzlingTempVC ()

@end

@implementation LLSwizzlingTempVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)instanceAction:(UIButton *)sender
{
    [super instanceAction:sender];
    NSLog(@"子类被点击");
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
