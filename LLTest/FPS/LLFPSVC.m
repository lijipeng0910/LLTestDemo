//
//  LLFPSVC.m
//  LLTest
//
//  Created by lijipeng on 2020/4/7.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLFPSVC.h"
#import "LLFPS.h"

@interface LLFPSVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tb;

@end

@implementation LLFPSVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[LLFPS sharedFPSIndicator] startMonitoring];

    // Do any additional setup after loading the view from its nib.
}

#pragma mark -- UITableViewDelegate  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
    }
    for (int x = 0; x < 20; x++) {
        UIView *view = [[UIView alloc] initWithFrame:cell.contentView.bounds];
        [cell.contentView addSubview:view];
        for (int i = 0; i < 20; i++) {
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(15+60*i, 10, 60, 60)];
            img.image = [UIImage imageNamed:@"exam"];
            [view addSubview:img];
            img.layer.masksToBounds = YES;
            img.layer.cornerRadius = 30;
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
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
