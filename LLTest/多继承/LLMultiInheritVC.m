//
//  LLMultiInheritVC.m
//  LLTest
//
//  Created by lijipeng on 2020/6/28.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLMultiInheritVC.h"
#import "LLProgrammer.h"

@interface LLMultiInheritVC ()

@end

@implementation LLMultiInheritVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLProgrammer *programer = [LLProgrammer new];
    [programer draw];
    [programer sing];
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
