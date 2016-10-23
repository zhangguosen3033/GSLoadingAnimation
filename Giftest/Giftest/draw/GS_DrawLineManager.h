//
//  DrawManage.h
//  Giftest
//
//  Created by ygkj on 16/10/21.
//  Copyright © 2016年 ygkj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
@interface GS_DrawLineManager : NSObject

+ (GS_DrawLineManager *)manager;

/**
 *绘制一条直虚线
 */
-(void)GS_DrawImaginaryLineWithStartPoint:(CGPoint)StartPoint EndPoint:(CGPoint)EndPoint LineColor:(UIColor *)LineColor LineHeight:(CGFloat)LineHeight InView:(UIView*)InView;

/**
 *绘制一条虚线
 */

@end
