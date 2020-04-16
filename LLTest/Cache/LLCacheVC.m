//
//  LLCacheVC.m
//  LLTest
//
//  Created by lijipeng on 2020/4/2.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLCacheVC.h"

@interface LLCacheVC ()<NSCacheDelegate>
@property (nonatomic, strong) NSCache *cache;

@end

@implementation LLCacheVC

- (NSCache *)cache {
    if (_cache == nil) {
        _cache = [[NSCache alloc] init];
        // 设置数量限制,最大限制为10
        _cache.countLimit = 10;
        _cache.delegate = self;
    }
    return _cache;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (int i = 0; i < 20; ++i) {
        NSString *str = [NSString stringWithFormat:@"hello - %04d", i];

        NSLog(@"设置 %@", str);
        // 添加到缓存
        [self.cache setObject:str forKey:@(i)];
    }

    // - 查看缓存内容，NSCache 没有提供遍历的方法，只支持用 key 来取值
    for (int i = 0; i < 20; ++i) {
        NSLog(@"缓存中----->%@", [self.cache objectForKey:@(i)]);
    }
}

// MARK: NSCache Delegate
// 当缓存中的对象被清除的时候，会自动调用
// obj 就是要被清理的对象
// 提示：不建议平时开发时重写！仅供调试使用
- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    [NSThread sleepForTimeInterval:0.5];
    NSLog(@"清除了-------> %@", obj);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
