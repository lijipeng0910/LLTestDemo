//
//  LLBlockVC.m
//  LLTest
//
//  Created by lijipeng on 2019/12/18.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLBlockVC.h"
#import "LLBlockView.h"

@interface LLBlockVC ()
@property (nonatomic, copy) void(^MyBlock)(void);
@property (nonatomic, copy) NSString *myString;
@property (nonatomic, assign) NSInteger myInteger;
@end

@implementation LLBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 测试__block修饰符，循环引用
    __block NSString *a = @"10";
    
    self.MyBlock = ^{
        [self reloadBlock];
//        self.myString = @"aaa";
//        NSLog(@"%@",_myString);
    };
//    self.MyBlock();

//    self.MyBlock = ^{
//        NSLog(@"%@",@(_myInteger));
//    };
//    self.MyBlock();
    
    LLBlockView *b = [LLBlockView new];
    b.frame = CGRectMake(100, 100, 100, 100);
    b.backgroundColor = [UIColor grayColor];
    NSLog(@"b retainCount %ld",CFGetRetainCount((__bridge CFTypeRef)(b)));
    [self.view addSubview:b];
    NSLog(@"b retainCount %ld",CFGetRetainCount((__bridge CFTypeRef)(b)));
    b.myBlock = ^{
        //[self reloadBlock];
    };

    // Do any additional setup after loading the view from its nib.
}

- (void)reloadBlock
{
    NSLog(@"reloadBlock");
}

- (void)dealloc
{
    NSLog(@"block---VC---dealloc");
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
