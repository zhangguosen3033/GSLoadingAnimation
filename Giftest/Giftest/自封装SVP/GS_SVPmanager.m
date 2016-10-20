//
//  SVPmanager.m
//  mall3658
//
//  Created by ygkj on 16/10/19.
//  Copyright © 2016年 Leo. All rights reserved.
//

#import "GS_SVPmanager.h"
#import "UIViewController+GSCategory.h"
@implementation GS_SVPmanager
static GS_SVPmanager *manager;

+ (GS_SVPmanager *)manager
{
    @synchronized(self)
    {
        if (manager == nil) {
            manager = [[self alloc] init];
        }
        return manager;
    }
}


- (void)GS_SVPshowGif:(UIViewController *)viewControll{
    
    [viewControll showGifLoding:nil inView:[UIApplication sharedApplication].keyWindow];
    
}

-(void)GS_SVPhidGif:(UIViewController *)viewControll{
    
    [viewControll hideGufLoding];
}

@end
