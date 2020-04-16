//
//  LLFPS.m
//  LLTest
//
//  Created by lijipeng on 2020/4/7.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLFPS.h"
#import <QuartzCore/CADisplayLink.h>

@interface LLFPS()

/** 计时器 */
@property (nonatomic, strong)  CADisplayLink *displayLink;
/** 1秒的刷新次数 */
@property (nonatomic, assign)  NSInteger count;
/** 开始计时的屏幕渲染的时间点 */
@property (nonatomic, assign)  NSInteger beginTime;

@end

@implementation LLFPS
+ (LLFPS *)sharedFPSIndicator {
    static dispatch_once_t onceToken;
    static LLFPS *fps;
    dispatch_once(&onceToken, ^{
        fps = [[LLFPS alloc] init];
    });
    return fps;
}

- (instancetype)init{
    
    if (self = [super init]) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTick:)];//此时会有循环引用，需另做处理
        [_displayLink setPaused:YES];
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

#pragma mark -- Help Methods

/**
 开始监测
 */
- (void)startMonitoring{
    _displayLink.paused = NO;
}

/**
 暂停监测
 */
- (void)pauseMonitoring{
    _displayLink.paused = YES;
}

/**
 移除监测
 */
- (void)removeMonitoring{
    [self pauseMonitoring];
    [_displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [_displayLink invalidate];
}

#pragma mark -- Event Handle

//这个方法的执行频率跟当前屏幕的刷新频率是一样的，屏幕每渲染刷新一次，就执行一次，那么1秒的时长执行刷新的次数就是当前的FPS值
- (void)displayLinkTick:(CADisplayLink *)link{

    //初始化屏幕渲染的时间
    if (_beginTime == 0) {
        _beginTime = link.timestamp;
        return;
    }
    //刷新次数累加
    _count++;
    //刚刚屏幕渲染的时间与最开始幕渲染的时间差
    NSTimeInterval interval = link.timestamp - _beginTime;
    if (interval < 1) {
        //不足1秒，继续统计刷新次数
        return;
    }
    //刷新频率
    float fps = _count / interval;
    NSLog(@"刷新频率%f",fps);

    //1秒之后，初始化时间和次数，重新开始监测
    _beginTime = link.timestamp;
    _count = 0;
}

- (void)dealloc{
    [self removeMonitoring];
}
@end
