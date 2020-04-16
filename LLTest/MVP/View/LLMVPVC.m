//
//  LLMVPVC.m
//  LLTest
//
//  Created by lijipeng on 2020/4/16.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLMVPVC.h"
#import "LLUserProtocol.h"
#import "LLPresenter.h"

@interface LLMVPVC ()<UITableViewDelegate, UITableViewDataSource, LLUserProtocol>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic,strong) NSArray<LLUserModel *> *friendlyUIData;

@property (nonatomic,strong) LLPresenter *presenter;

@end

@implementation LLMVPVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.indicatorView];
    
    [self.presenter fetchData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    LLUserModel *model = self.friendlyUIData[indexPath.row];
    cell.textLabel.text = model.name;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friendlyUIData.count;
}

#pragma mark - LLUserProtocol
- (void)userViewDataSource:(NSArray<LLUserModel *> *)data {
    self.friendlyUIData = data;
    [self.tableView reloadData];
}

- (void)showIndicator {
    [self.indicatorView startAnimating];
    self.indicatorView.hidden = NO;
}

- (void)hideIndicator {
    [self.indicatorView stopAnimating];
}

- (void)showEmptyView {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Alert" message:@"show empty view" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertView animated:YES completion:^{
        
    }];
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UIActivityIndicatorView *)indicatorView {
    if (_indicatorView == nil) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.height/2.0);
        _indicatorView.hidesWhenStopped = YES;
    }
    return _indicatorView;
}

- (LLPresenter *)presenter {
    if (_presenter == nil) {
        _presenter = [[LLPresenter alloc] init];
        [_presenter attachView:self];
    }
    return _presenter;
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
