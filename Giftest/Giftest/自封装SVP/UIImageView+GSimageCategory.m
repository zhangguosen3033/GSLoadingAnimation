//
//  UIImageView+GSimageCategory.m
//  Giftest
//
//  Created by ygkj on 16/10/19.
//  Copyright © 2016年 ygkj. All rights reserved.
//

#import "UIImageView+GSimageCategory.h"

@implementation UIImageView (GSimageCategory)
// 播放GIF
- (void)playGif:(NSArray *)images{
    if (!images.count) {
        return;
    }
    //动画图片数组
    self.animationImages = images;
    //执行一次完整动画所需的时长
    self.animationDuration = 0.5;
    //动画重复次数, 设置成0 就是无限循环
    self.animationRepeatCount = 0;
    [self startAnimating];
}
// 停止动画
- (void)stopGif{
    if (self.isAnimating) {
        [self stopAnimating];
    }
    [self removeFromSuperview];
}

@end
