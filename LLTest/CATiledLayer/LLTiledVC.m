//
//  LLTiledVC.m
//  LLTest
//
//  Created by lijipeng on 2020/4/12.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLTiledVC.h"
#import "LLTiledView.h"

@interface LLTiledVC ()

@end

@implementation LLTiledVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLTiledView *view = [[LLTiledView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [view ll_setImageName:@"中国地图11935x8554.jpg"];
    [self.view addSubview:view];
    
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
