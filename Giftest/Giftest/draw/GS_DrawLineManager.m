//
//  DrawManage.m
//  Giftest
//
//  Created by ygkj on 16/10/21.
//  Copyright © 2016年 ygkj. All rights reserved.
//

#import "GS_DrawLineManager.h"
@implementation GS_DrawLineManager
static GS_DrawLineManager *manager;

+ (GS_DrawLineManager *)manager
{
    @synchronized(self)
    {
        if (manager == nil) {
            
            manager = [[self alloc] init];
        }
        return manager;
    }
}

-(void)GS_DrawImaginaryLineWithStartPoint:(CGPoint)StartPoint EndPoint:(CGPoint)EndPoint LineColor:(UIColor *)LineColor LineHeight:(CGFloat)LineHeight InView:(UIView*)InView{
    
    //layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    [shapeLayer setFillColor:[[UIColor blackColor] CGColor]];
    
    //设置虚线的颜色 - 颜色请必须设置
    [shapeLayer setStrokeColor:LineColor.CGColor];
    
    //设置虚线的高度
    [shapeLayer setLineWidth:LineHeight];
    
    //设置类型
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    /*
     2.f=每条虚线的长度
     2.f=每两条线的之间的间距
     */
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:2.f],
      [NSNumber numberWithInt:2.f],nil]];
    
    // Setup the path
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    /*
     代表初始坐标的x，y
     y:要和下面的y一样。
     */
    CGPathMoveToPoint(path1, NULL,StartPoint.x, StartPoint.y);
    
    /*
     代表坐标的x，y
     要与上面的y大小一样，才能使平行的线，不然会画出斜线
     */
    CGPathAddLineToPoint(path1, NULL, EndPoint.x,EndPoint.y);
    
    //赋值给shapeLayer
    [shapeLayer setPath:path1];
    
    //清除
    CGPathRelease(path1);
    
    //可以把self改成任何你想要的UIView.
    [[InView layer] addSublayer:shapeLayer];

}

@end
