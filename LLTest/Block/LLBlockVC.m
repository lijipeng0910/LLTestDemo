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

{
    LLBlockView *bView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 查看block是否在栈区
    int stack = 0;
    NSLog(@"stack block %@", [^{NSLog(@"%d", stack);} class]);
    
#pragma mark - 测试__block修饰符，循环引用
    __block NSString *a = @"10";
    
    __block NSMutableString * str = [[NSMutableString alloc]initWithString:@"Hello"];
    self.MyBlock = ^{
//        str = @"aaaa";
//        NSLog(@"mu====%@",str);
    };
    self.MyBlock();
    NSLog(@"%@",self.MyBlock);
    
    __weak typeof(self) weakSelf = self;
    self.MyBlock = ^{
        __strong typeof(self) strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [strongSelf reloadBlock];
        });
    };
    self.MyBlock();


    LLBlockView *b = [LLBlockView new];
    b.frame = CGRectMake(100, 100, 100, 100);
    b.backgroundColor = [UIColor grayColor];
    NSLog(@"b retainCount %ld",CFGetRetainCount((__bridge CFTypeRef)(b)));
    [self.view addSubview:b];
    NSLog(@"b retainCount %ld",CFGetRetainCount((__bridge CFTypeRef)(b)));
    LLBlockView *c = b;
    NSLog(@"b retainCount %ld",CFGetRetainCount((__bridge CFTypeRef)(b)));
    NSLog(@"c retainCount %ld",CFGetRetainCount((__bridge CFTypeRef)(c)));

    b.myBlock = ^{
//        [self reloadBlock];
    };

    __block int count = 10;
    void (^ blk)(void) = ^(){
        count = 20;
        NSLog(@"In Block:%d", count);//打印：In Block:20
    };
    blk();

    count ++;
    NSLog(@"Out Block:%d", count);//打印：Out Block:21
    
#pragma mark - 测试NSString指针地址以及内容地址
    __block NSString *aa = @"aa";
    NSLog(@"1---指针地址：%p,内容地址：%p,%@",&aa,aa,aa);
    void (^ block)(void) = ^(){
        NSLog(@"2---指针地址：%p,内容地址：%p,%@",&aa,aa,aa);
        aa = @"aaa";
        NSLog(@"3---指针地址：%p,内容地址：%p,%@",&aa,aa,aa);
    };
    block();
    NSLog(@"4---指针地址：%p,内容地址：%p,%@",&aa,aa,aa);
    aa = @"aaaa";
    NSLog(@"5---指针地址：%p,内容地址：%p,%@",&aa,aa,aa);
    
#pragma mark - 测试NSMutableString指针地址以及内容地址
    __block NSMutableString *maa = [NSMutableString stringWithString:@"maa"];
    NSLog(@"1===指针地址：%p,内容地址：%p",&maa,maa);
    void (^ mBlock)(void) = ^(){
        NSLog(@"2===指针地址：%p,内容地址：%p",&maa,maa);
        [maa stringByAppendingString:@"a"];
        NSLog(@"3===指针地址：%p,内容地址：%p",&maa,maa);
    };
    mBlock();
    NSLog(@"4===指针地址：%p,内容地址：%p",&maa,maa);
    [maa stringByAppendingString:@"a"];
    NSLog(@"5===指针地址：%p,内容地址：%p",&maa,maa);
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
