//
//  LLAlgorithmVC.m
//  LLTest
//
//  Created by lijipeng on 2019/12/17.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLAlgorithmVC.h"

@interface LLAlgorithmVC ()

@end

@implementation LLAlgorithmVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"LLAlgorithmVC---willAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray * arr = @[@7,@6,@3,@1,@2,@5,@4].mutableCopy;
    int arrCount = (int)arr.count;
    /*冒泡排序
    for (int i = 0; i < arrCount-1; i++) {
        for (int j = 0; j < arrCount-1-i; j++) {
            if ([arr[j] intValue]>[arr[j+1] intValue]) {
                NSNumber *temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
     */
    
    /*选择排序
    for (int i = 0; i < arrCount-1; i++) {
        int min = i;
        for (int j = i+1; j < arrCount; j++) {
            if ([arr[min] intValue]>[arr[j] intValue]) {
                min = j;
            }
        }
        if (i!=min) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:min];
        }
    }
     */
    
    /*插入排序
    for (int i = 1; i < arrCount; i++) {
        int a = [arr[i] intValue];
        int k = i - 1;
        while (k >= 0 && [arr[k] intValue] > a)  {
            arr[k+1] = arr[k];
            k-=1;
        }
        arr[k+1] = @(a);
    }
    */
    
    //快速排序
    [self quickSortArray:arr leftIndex:0 rightIndex:arrCount-1];
    NSLog(@"%@",arr);
    
    //递归求和
    NSLog(@"sum=%d",[self sum:100]);
    
    //判断回文数
    [self isPalindrome:121];
    
    //取两个数组的交集
    NSArray *result = [self intersectArr1:@[@1,@2,@3] arr2:@[@2,@3,@4]];
    NSLog(@"交集%@",result);

    //数组分组
    NSArray *group = [self sortArrayGroup];
    NSLog(@"分组%@",group);
    // Do any additional setup after loading the view from its nib.
}

- (void)quickSortArray:(NSMutableArray *)array leftIndex:(int)leftIndex rightIndex:(int)rightIndex
{
    if (leftIndex>=rightIndex) {
        return;
    }
    int i = leftIndex;
    int j = rightIndex;
    int key = [array[i] intValue];
    while (i < j) {
        while (i < j && [array[j] intValue] >= key) {
            j--;
        }
        array[i] = array[j];
        NSLog(@"1===%@",array);
        while (i < j && [array[i] intValue] <= key) {
            i++;
        }
        array[j] = array[i];
        NSLog(@"2===%@",array);
    }
    array[i] = @(key);
    NSLog(@"3===%@",array);
    [self quickSortArray:array leftIndex:leftIndex rightIndex:i-1];
    [self quickSortArray:array leftIndex:i+1 rightIndex:rightIndex];
}

- (int)sum:(int)max
{
    if (max>1) {
        return max+[self sum:max-1];
    } else {
        return 1;
    }
}

- (BOOL)isPalindrome:(int)x
{
    // 负数的第一位带有负号'-'，所以一定不是回文数
    // 长度超过一位的数字，第一位肯定不是 0，因此末尾是 0，则一定不是回文数
    if (x < 0 || (x % 10 == 0 && x != 0)) return false;
    // 余下的代码，如果看不懂原理，就带入几个具体的数字，手工模拟运行过程，就很容易明白了
    int revertedNumber = 0;
    while (x > revertedNumber) {
        revertedNumber = revertedNumber * 10 + x % 10;
        x /= 10;
    }
    return x == revertedNumber || x == revertedNumber / 10;
}

- (NSArray *)intersectArr1:(NSArray *)arr1 arr2:(NSArray *)arr2
{
    NSArray *tempArr1 = [arr1 sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    NSArray *tempArr2 = [arr2 sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    int i = 0;
    int j = 0;
    NSMutableArray *result = [NSMutableArray array];
    while (i < tempArr1.count && j < tempArr2.count) {
        if ([tempArr2[j] intValue] > [tempArr1[i] intValue]) {
            i++;
        } else if ([tempArr2[j] intValue] < [tempArr1[i] intValue]) {
            j++;
        } else {
            [result addObject:tempArr1[i]];
            i++;
            j++;
        }
    }
    return result.copy;
}

- (NSArray *)sortArrayGroup
{
    NSArray *temp = @[@"红",@"蓝",@"黄",@"黄",@"蓝",@"红",@"红"];
    NSMutableArray *arr = [NSMutableArray array];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (int i = 0; i < temp.count; i++) {
        if (!dic[temp[i]]) {
            [arr addObject:temp[i]];
            dic[temp[i]] = temp[i];
        } else {
            for (int j = 0; j < arr.count; j++) {
                if ([temp[i] isEqual:arr[j]]) {
                    [arr insertObject:temp[i] atIndex:j+1];
                    break;
                }
            }
        }
    }
    return arr.copy;
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
