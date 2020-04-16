//
//  LLAlgorithmVC.m
//  LLTest
//
//  Created by lijipeng on 2019/12/17.
//  Copyright © 2019 lijipeng. All rights reserved.
//

#import "LLAlgorithmVC.h"
#import <WebKit/WebKit.h>
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
