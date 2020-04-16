//
//  LLTiledView.h
//  LLTest
//
//  Created by lijipeng on 2020/4/12.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLTiledView : UIView

- (void)ll_setImageName:(NSString *)imageName tiledCount:(int)tiledCount;

- (void)ll_setImageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
