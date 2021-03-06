//
//  ViewController.m
//  LLTest
//
//  Created by lijipeng on 2019/12/17.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "ViewController.h"
#import "LLAlgorithmVC.h"
#import "LLResponderVC.h"
#import "LLBlockVC.h"
#import "LLLoadVC.h"
#import "LLTimerVC.h"
#import "LLLayoutVC.h"
#import "LLSingleVC.h"
#import "LLThreadVC.h"
#import "LLRunloopVC.h"
#import "LLRuntimeVC.h"
#import "LLSwizzlingVC.h"
#import "LLAutoreleaseVC.h"
#import "LLCategoryVC.h"
#import "LLLockVC.h"
#import "LLKVOVC.h"
#import "LLHashVC.h"
#import "LLCacheVC.h"
#import "LLSQLiteVC.h"
#import "LLFPS.h"
#import "LLAsyncVC.h"
#import "LLTiledVC.h"
#import "LLMVPVC.h"
#import "LLWKWebViewVC.h"
#import "LLUIWebViewVC.h"
#import "LLFactoryVC.h"
#import "LLAbstractVC.h"
#import "LLTransformVC.h"
#import "LLMultiDelegateVC.h"
#import "LLMultiInheritVC.h"
#import "LLLRUVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tb;
@property (strong, nonatomic) NSMutableArray *arr;
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"基类VC---willAppear");
}

- (NSMutableArray *)arr
{
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DEMO";
    self.arr = @[@"算法",@"响应者链",@"Block",@"Load",@"NSTimer",@"Layout",@"单例",@"多线程",@"Runloop",@"Runtime",@"Swizzling",@"AutoreleasePool",@"Category",@"Lock",@"KVO",@"Hash",@"NSCache",@"SQLite",@"FPS",@"异步绘制",@"CATiledLayer",@"MVP",@"WKWebView",@"UIWebView",@"工厂方法模式",@"抽象工厂模式",@"字典转模型",@"多代理",@"多继承",@"LRU"].mutableCopy;
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSLog(@"main===%@",mainBundle);
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *classArr = @[@"LLAlgorithmVC",@"LLResponderVC",@"LLBlockVC",@"LLLoadVC",@"LLTimerVC",@"LLLayoutVC",@"LLSingleVC",@"LLThreadVC",@"LLRunloopVC",@"LLRuntimeVC",@"LLSwizzlingVC",@"LLAutoreleaseVC",@"LLCategoryVC",@"LLLockVC",@"LLKVOVC",@"LLHashVC",@"LLCacheVC",@"LLSQLiteVC",@"LLFPSVC",@"LLAsyncVC",@"LLTiledVC",@"LLMVPVC",@"LLWKWebViewVC",@"LLUIWebViewVC",@"LLFactoryVC",@"LLAbstractVC",@"LLTransformVC",@"LLMultiDelegateVC",@"LLMultiInheritVC",@"LLLRUVC"];
    UIViewController *vc = [NSClassFromString(classArr[indexPath.row]) new];
    vc.title = classArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
