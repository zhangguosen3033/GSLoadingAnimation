//
//  SVPmanager.h
//  mall3658
//
//  Created by ygkj on 16/10/19.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
@interface GS_SVPmanager : NSObject

+ (GS_SVPmanager *)manager;

//控制器显示gif动画
-(void)GS_SVPshowGif:(UIViewController *)viewControll;

//控制器隐藏gif动画
-(void)GS_SVPhidGif:(UIViewController *)viewControll;
@end
