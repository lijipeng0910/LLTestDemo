//
//  LLAsyncVC.m
//  LLTest
//
//  Created by lijipeng on 2020/4/8.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLAsyncVC.h"
#import "LLAsyncLabel.h"

@interface LLAsyncVC ()

@end

@implementation LLAsyncVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLAsyncLabel *label = [[LLAsyncLabel alloc] initWithFrame:CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width - 2 * 50, 100)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = @"今天是个好日子啊，心想的事儿都能成，今天是个好日子啊，啊，安心，太平";
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    [label.layer setNeedsDisplay];
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
