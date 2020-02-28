//
//  LLBlockView.h
//  LLTest
//
//  Created by lijipeng on 2020/1/3.
//  Copyright © 2020 lijipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LLBlock)(void);

@interface LLBlockView : UIView
@property (nonatomic, copy) LLBlock myBlock;

@end

NS_ASSUME_NONNULL_END
