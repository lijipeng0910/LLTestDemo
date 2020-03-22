//
//  LLHashVC.m
//  LLTest
//
//  Created by lijipeng on 2020/3/17.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLHashVC.h"
#import "LLKey.h"

@interface LLHashVC ()

@end

@implementation LLHashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    LLKey *key = [[LLKey alloc] initWithKeyName:@"key"];
    NSLog(@"key is %p", key);
    [dic setObject:@"object" forKey:key];
    NSLog(@"value is %@", dic[key]);
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
