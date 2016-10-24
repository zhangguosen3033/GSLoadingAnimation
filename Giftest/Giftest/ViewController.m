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
    UIView *windowview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    windowview = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];

    [self.view addSubview:windowview];
    
    //加载转场动画
    [[GS_SVPmanager manager]GS_SVPshowGif:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //调用绘制虚线
        [[GS_DrawLineManager manager]GS_DrawImaginaryLineWithStartPoint:CGPointMake(20, 100) EndPoint:CGPointMake(300, 100) LineColor:[UIColor blackColor] LineHeight:1.0f InView:windowview];
        
        
        //键盘相关
        [self.view addSubview:self.textfiled];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
        
        self.numberArray = [@[@"1", @"2", @"3", @"-",@"4", @"5", @"6",@"_", @"7", @"8", @"9",@"删除", @",", @"0", @".",@"完成"] mutableCopy];
       
        
    //动画加载结束
    [[GS_SVPmanager manager]GS_SVPhidGif:self];
        
        NSLog(@"结束了");
    });

}

- (void)keyboardDidShow:(NSNotification *)notification{
    
    UIView *keyboardView = [self getKeyboardView];
    
    [keyboardView addSubview:self.KeyView];
    
    self.KeyView.frame = keyboardView.frame;
    self.KeyView.backgroundColor = [UIColor lightGrayColor];
    
    [self setUpMyKeyBoard];
    
    
}
#pragma mark -自定义控件布局
- (void)setUpMyKeyBoard
{
    NSInteger index = 0;
    for (NSInteger i = 0; i < 4; i++) {
        for (NSInteger j = 0; j < 4; j++) {
            UIButton *numberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            numberBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/4*j, self.KeyView.frame.size.height/4*i, [UIScreen mainScreen].bounds.size.width/4, self.KeyView.frame.size.height/4);
            [numberBtn setTitle:_numberArray[index] forState:UIControlStateNormal];
            numberBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            numberBtn.tag = 1000+index;
            [numberBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
            [numberBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            numberBtn.backgroundColor =[UIColor lightGrayColor];
            [numberBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.KeyView addSubview:numberBtn];
            
            index++;
        }
        
    }
}


//按钮的点击事件
- (void)clickAction:(UIButton *)sender{
    
    [sender setHighlighted:YES];
    if (!(sender.tag == 1015 || sender.tag == 1011)) {
        self.textfiled.text = [NSString stringWithFormat:@"%@%@", self.textfiled.text, sender.titleLabel.text];
    }else{
        if (sender.tag == 1015) {
            
            [self.textfiled resignFirstResponder];
            
        }else{
            //删除事件
            if ([self.textfiled.text length] != 0) {
                self.textfiled.text = [self.textfiled.text substringToIndex:([self.textfiled.text length] - 1)];
            }
        }
    }
    
}

#pragma mark -点击空白处屏幕消失
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.textfiled resignFirstResponder];
}



#pragma mark -拿到键盘的view的方法

- (UIView *)getKeyboardView
{
    UIView *keyboardView = nil;
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in [windows reverseObjectEnumerator])//逆序效率更高，因为键盘总在上方
    {
        keyboardView = [self findKeyboardInView:window];
        if (keyboardView)
        {
            return keyboardView;
        }
    }
    return nil;
}
- (UIView *)findKeyboardInView:(UIView *)view
{
    for (UIView *subView in [view subviews])
    {
        if (strstr(object_getClassName(subView), "UIKeyboard"))
        {
            return subView;
        }
        else
        {
            UIView *tempView = [self findKeyboardInView:subView];
            if (tempView)
            {
                return tempView;
            }
        }
    }
    return nil;
}


#pragma mark - 懒加载
-(UITextField *)textfiled{
    
    if (_textfiled ==nil) {
        
        _textfiled =[[UITextField alloc]initWithFrame:CGRectMake(0, 200, 100, 50)];
        _textfiled.placeholder = @"输入内容";
    }
    
    return _textfiled;
}

-(UIView *)KeyView{
    
    if (_KeyView ==nil) {
        
        _KeyView = [[UIView alloc]init];
        
    }
    return _KeyView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
