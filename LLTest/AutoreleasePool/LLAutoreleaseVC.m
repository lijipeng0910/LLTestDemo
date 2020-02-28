//
//  LLAutoreleaseVC.m
//  LLTest
//
//  Created by lijipeng on 2020/1/9.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLAutoreleaseVC.h"

@interface LLAutoreleaseVC ()

@end

@implementation LLAutoreleaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - AutoreleasePool应用
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < 100000; i++) {
            @autoreleasepool {
                UIImage *img = [UIImage imageNamed:@""];
                NSLog(@"img = %@",img);
            }
        }
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
