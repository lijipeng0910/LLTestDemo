//
//  LLCategoryVC.m
//  LLTest
//
//  Created by lijipeng on 2020/2/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLCategoryVC.h"
#import "LLCategoryVC+Add.h"
#import <objc/runtime.h>

@interface LLCategoryVC ()

@end

@implementation LLCategoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark - 如何调用被category重写的原有方法（通过遍历，category添加的方法在前，原有方法在后）
    //[self testCategory];
    
    unsigned int methodCount;
    Method *methodList = class_copyMethodList(self.class, &methodCount);
    IMP lastImp = NULL;
    SEL lastSel = NULL;
    for (NSInteger i = 0; i < methodCount; i++) {
        Method method = methodList[i];
        NSString *methodName = [NSString stringWithCString:sel_getName(method_getName(method)) encoding:NSUTF8StringEncoding];
        if ([@"testCategory" isEqualToString:methodName]) {
            lastImp = method_getImplementation(method);
            lastSel = method_getName(method);
        }
    }
    typedef void (*fn)(id, SEL);
    if (lastImp != NULL) {
        fn f = (fn)lastImp;
        f(self, lastSel);
    }
    free(methodList);
    // Do any additional setup after loading the view from its nib.
}

- (void)testCategory
{
    NSLog(@"分类一");
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
