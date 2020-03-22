//
//  LLKVOVC.m
//  LLTest
//
//  Created by lijipeng on 2020/2/29.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLKVOVC.h"
#import "LLPerson.h"

@interface LLKVOVC ()

@end

@implementation LLKVOVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 手动设定实例变量的kvo实现监听
    LLPerson *p = [LLPerson new];
    [p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    p.age = 20;
    // Do any additional setup after loading the view from its nib.
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    NSLog(@"%@", change);
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
