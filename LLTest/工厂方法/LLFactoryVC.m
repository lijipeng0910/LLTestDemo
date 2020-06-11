//
//  LLFactoryVC.m
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLFactoryVC.h"
#import "LLBaseProduct.h"
#import "LLCarProduct.h"
#import "LLBikeProduct.h"
#import "LLBaseFactory.h"
#import "LLCarFactory.h"
#import "LLBikeFactory.h"

@interface LLFactoryVC ()

@end

@implementation LLFactoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLBaseProduct *car = [LLCarFactory createProduct];
    [car setProductName];
    NSLog(@"car is %@", car.name);
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
