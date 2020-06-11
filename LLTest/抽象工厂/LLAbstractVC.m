//
//  LLAbstractVC.m
//  LLTest
//
//  Created by lijipeng on 2020/5/26.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLAbstractVC.h"
#import "LLAbstractProduct.h"
#import "LLMeatProduct.h"
#import "LLFishProduct.h"
#import "LLAbstractFactory.h"
#import "LLMeatFactory.h"
#import "LLFishFactory.h"

@interface LLAbstractVC ()

@end

@implementation LLAbstractVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLAbstractFactory *factory = [LLAbstractFactory factoryWithType:LLMeatType];
    LLAbstractProduct *meat = [factory createProduct];
    [meat setProductName];
    NSLog(@"meat is %@", meat.name);
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
