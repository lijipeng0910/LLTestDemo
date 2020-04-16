//
//  LLTiledView.m
//  LLTest
//
//  Created by lijipeng on 2020/4/12.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import "LLTiledView.h"

@interface LLTiledView(){
    long long totalCount;
    long long tiledCount;
    UIImage *originImage;
    CGRect imageRect;
    CGFloat imageScale_w;
    CGFloat imageScale_h;
}

@end

@implementation LLTiledView

- (void)ll_setImageName:(NSString *)imageName tiledCount:(int)tiledCount {
    tiledCount = tiledCount;
    [self ll_setImageName:imageName];
}

- (void)ll_setImageName:(NSString *)imageName {
    [self ll_setImage:[UIImage imageNamed:imageName]];
}

- (void)ll_setImage:(UIImage *)image {
    if (tiledCount == 0) tiledCount = 81;
    originImage = image;
    [self setBackgroundColor:[UIColor whiteColor]];
    imageRect = CGRectMake(0.0f,
                           0.0f,
                           CGImageGetWidth(originImage.CGImage),
                           CGImageGetHeight(originImage.CGImage));
    imageScale_w = self.frame.size.width/imageRect.size.width;
    imageScale_h = self.frame.size.height/imageRect.size.height;
    CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
    
    int scale = (int)MAX(1/imageScale_w, 1/imageScale_h);
    
    int lev = ceil(scale);
    tiledLayer.levelsOfDetail = 1;
    tiledLayer.levelsOfDetailBias = lev;
    
    if(tiledCount > 0){
        NSInteger tileSizeScale = sqrt(tiledCount)/2;
        CGSize tileSize = self.bounds.size;
        tileSize.width /=tileSizeScale;
        tileSize.height /=tileSizeScale;
        tiledLayer.tileSize = tileSize;
    }
}

+ (Class)layerClass {
    return [CATiledLayer class];
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"rect %@",NSStringFromCGRect(rect));
    @autoreleasepool{
        CGRect imageCutRect = CGRectMake(rect.origin.x / imageScale_w,
                                            rect.origin.y / imageScale_h,
                                         rect.size.width / imageScale_w,
                                         rect.size.height / imageScale_h);
        CGImageRef imageRef = CGImageCreateWithImageInRect(originImage.CGImage, imageCutRect);
        UIImage *tileImage = [UIImage imageWithCGImage:imageRef];
        CGContextRef context = UIGraphicsGetCurrentContext();
        UIGraphicsPushContext(context);
        [tileImage drawInRect:rect];
        CGImageRelease(imageRef);
        UIGraphicsPopContext();
        
        totalCount++;
        NSLog(@"实际分片总数：%lld",totalCount);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
