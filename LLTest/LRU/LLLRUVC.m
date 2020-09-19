//
//  LLLRUVC.m
//  LLTest
//
//  Created by lijipeng on 2020/6/22.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLLRUVC.h"
#import "LLLRUDictionary.h"

@interface LLLRUVC ()

@end

@implementation LLLRUVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLLRUDictionary *cache = [[LLLRUDictionary alloc] initWithMaxCountLRU:5];
    for (int i = 1; i <= 5; i++) {
        [cache setObject:[NSString stringWithFormat:@"%d",i] forKey:[NSString stringWithFormat:@"%d",i]];
    }
    [cache enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@,%@",key,obj);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 6; i <= 10; i++) {
            [cache setObject:[NSString stringWithFormat:@"%d",i] forKey:[NSString stringWithFormat:@"%d",i]];
        }
        [cache enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"%@,%@",key,obj);
        }];
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
