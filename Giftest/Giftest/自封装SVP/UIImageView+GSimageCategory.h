//
//  UIImageView+GSimageCategory.h
//  Giftest
//
//  Created by ygkj on 16/10/19.
//  Copyright © 2016年 ygkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (GSimageCategory)
// 播放GIF
- (void)playGif:(NSArray *)images;
// 停止动画
- (void)stopGif;
@end
