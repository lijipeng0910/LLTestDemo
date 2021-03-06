//
//  LLSQLiteVC.m
//  LLTest
//
//  Created by lijipeng on 2020/4/2.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLSQLiteVC.h"
#import "DPDatabaseManager.h"
#import "FMDBMigrationManager.h"
#import "LLModel.h"
#import "LLMigration.h"

@interface LLSQLiteVC ()
@property (weak, nonatomic) IBOutlet UITableView *tb;
@property (strong, nonatomic) NSMutableArray *arr;
@end

@implementation LLSQLiteVC

- (NSMutableArray *)arr
{
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self reloadAllData];
    // Do any additional setup after loading the view from its nib.
}

- (void)reloadAllData
{
    //获取全部数据
    NSArray *dbArray = [[DPDatabaseManager sharedDBManager]getAllDataWithModelClass:[LLModel class] withFileName:@"textDemo"];
    [self.arr addObjectsFromArray:dbArray];
    [self.tb reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LLModel *model = [self.arr objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"姓名:%@ 年龄:%ld 是否成仙:%@",model.userName,model.userAge,model.isAdult?@"是":@"否"];
    return cell;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString *name = [[NSArray arrayWithObjects:@"张三", @"李四", @"王五", @"赵六", @"鬼脚七", @"张小凡", @"碧瑶", @"周一仙", @"炼器师", nil] objectAtIndex:arc4random() % 8];
    NSUInteger age = arc4random() % 101 + 1;
    NSUInteger adult = arc4random() % 2;
    
    LLModel *model = [[LLModel alloc]init];
    model.userName = name;
    model.userAge = age;
    model.isAdult = adult == 1?YES:NO;
    
    //数据插入
    [[DPDatabaseManager sharedDBManager]insertDataWithModel:model withFileName:@"textDemo"];
    
    [self doDataBaseVersion];
}

#pragma mark - 数据库升级新增字段
- (void)doDataBaseVersion{
    //数据库兼容问题 数据库迁移
    NSString *DBPath = [DPDatabaseManager sharedDBManager].dbFilePath;
    //DBPath是要升级的数据库的地址
    FMDBMigrationManager * manager = [FMDBMigrationManager managerWithDatabaseAtPath:DBPath migrationsBundle:[NSBundle mainBundle]];
    NSLog(@"======%@",[NSBundle mainBundle]);
    
    LLMigration * migration_1 = [[LLMigration alloc]initWithName:@"新增字段email" andVersion:1 andExecuteUpdateArray:@[[NSString stringWithFormat:@"alter table %@ add email text",[DPDatabaseManager sharedDBManager].dbTableName]]];
    [manager addMigration:migration_1];

    BOOL resultState=NO;
    NSError * error=nil;
    if (!manager.hasMigrationsTable) {
        resultState=[manager createMigrationsTable:&error];
    }
    
    //UINT64_MAX 表示升级到最高版本
    resultState=[manager migrateDatabaseToVersion:UINT64_MAX progress:nil error:&error];
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
