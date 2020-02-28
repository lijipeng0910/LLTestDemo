//
//  LLLoadVC.m
//  LLTest
//
//  Created by lijipeng on 2019/12/18.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLLoadVC.h"
#import "LLLoadAView.h"
#import "LLLoadBView.h"

@interface LLLoadVC ()

@end

@implementation LLLoadVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 查看load、initialize调用过程
    //LLLoadAView *a = [LLLoadAView new];
    //[LLLoadAView share];
    
    [LLLoadBView share];
    
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
