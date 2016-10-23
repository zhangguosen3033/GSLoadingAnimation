//
//  ViewController.m
//  Giftest
//
//  Created by ygkj on 16/10/19.
//  Copyright © 2016年 ygkj. All rights reserved.
//

#import "ViewController.h"
#import "GS_SVPmanager.h"
#import "GS_DrawLineManager.h"
@interface ViewController ()
{
    UIView *view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:view];
    
    [[GS_SVPmanager manager]GS_SVPshowGif:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //调用绘制虚线
        [[GS_DrawLineManager manager]GS_DrawImaginaryLineWithStartPoint:CGPointMake(20, 100) EndPoint:CGPointMake(300, 100) LineColor:[UIColor blackColor] LineHeight:1.0f InView:view];

        
        
        
        
        
        
        [[GS_SVPmanager manager]GS_SVPhidGif:self];
        
        NSLog(@"结束了");
    });

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
