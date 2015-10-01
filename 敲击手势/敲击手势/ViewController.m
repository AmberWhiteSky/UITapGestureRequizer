//
//  ViewController.m
//  敲击手势
//
//  Created by AmberWhiteSky on 15/10/1.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self  test2];
   }



-(void)  test2{
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapview)];
    tap.delegate=self;
    [self.iconView  addGestureRecognizer:tap];
}

-(void)test{
    //1.创建手势识别器对象
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer  alloc]init];
    tap.numberOfTapsRequired =2;
    tap.numberOfTouchesRequired=2;
    
    //2.将手势识别器对象添加到对应的view
    [self .iconView addGestureRecognizer:tap];
    
    //3.添加肩痛方法（识别到了对应的手势，就会掉用监听方法）
    [tap  addTarget:self action:@selector(tapview)];


}

#pragma  mark 代理方法
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {

    CGPoint  POS =[touch  locationInView:touch.view];
    if (POS.x<=self.iconView.frame.size.width*0.5) {
        return YES;
        
    }
    
    NSLog(@"%@",NSStringFromCGPoint(POS));
    return NO;
}


-(void) tapview{
    NSLog(@"tapview");
}


@end
