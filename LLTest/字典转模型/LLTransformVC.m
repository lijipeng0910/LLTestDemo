//
//  LLTransformVC.m
//  LLTest
//
//  Created by lijipeng on 2020/6/4.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLTransformVC.h"
#import "LLProduct.h"
#import "NSObject+LLModel.h"

@interface LLTransformVC ()

@end

@implementation LLTransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dic = @{@"name":@"苹果",@"address":@"北京"};
    LLProduct *pro = [LLProduct modelWithDict:dic];
    NSLog(@"pro is %@",pro);
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
