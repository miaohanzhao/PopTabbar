//
//  Home.m
//  pod
//
//  Created by Miu on 16/3/3.
//  Copyright © 2016年 DD. All rights reserved.
//
#import "Home.h"
#import <POP/POP.h>

@interface Home ()
{
    UIView *view;
}
@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255 / 256.0f green:arc4random()%255 / 256.0f  blue:arc4random()%255 / 256.0f  alpha:1.0f];
    
#if 0
    
    view =[[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];;
    view.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    view.layer.cornerRadius = 50;
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    
#endif

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
        
    [UIView animateWithDuration:0.2 animations:^{
        
       view.transform = CGAffineTransformMakeScale(1.2, 1.2);
            
    } completion:^(BOOL finished) {
        
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        
        //放大缩小的倍数
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        anim.springBounciness = 10.0;
        anim.springSpeed = 8.0;
        anim.dynamicsMass = 2.0;
        anim.dynamicsFriction = 5;
        anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            if (finished) {NSLog(@"Animation finished!");}};
        [view.layer pop_addAnimation:anim forKey:@"center"];

    }];
  
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
