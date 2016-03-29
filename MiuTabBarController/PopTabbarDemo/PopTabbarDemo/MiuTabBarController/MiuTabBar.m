//
//  MiuTarbar.m
//  pod
//
//  Created by Miu on 16/3/16.
//  Copyright © 2016年  All rights reserved.
//

#import "MiuTabBar.h"
#import <POP/POP.h>

#import "MiuButton.h"

#define  kScreenWidth [UIScreen mainScreen].bounds.size.width
#define  randomColor [UIColor colorWithRed:arc4random()%255 / 256.0f green:arc4random()%255 / 256.0f  blue:arc4random()%255 / 256.0f  alpha:1.0f]

@implementation MiuTabBar
{
    MiuButton *btn;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ScaleRatio = 1.2;
        self.titleSize = 13;
        self.springBounciness = 10.0;
        self.springSpeed = 8.0;
        self.dynamicsMass = 0.1;
        self.dynamicsFriction = 3;
        self.titleColor = [UIColor grayColor];
        self.titleColorSeleted = [UIColor blueColor];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)SetupItemsWithItem:(NSArray *)itemArray
{
    
    //每个按钮宽度
    CGFloat btnWith = kScreenWidth / itemArray.count;
    
    for (NSInteger i = 0; i < itemArray.count; i++) {
        
        btn = [[MiuButton alloc]init];
        btn.titleSize = self.titleSize;
        btn.titleColor = self.titleColor;
    
        btn.tag = i + 100;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnClick:)];
        [btn addGestureRecognizer:tap];
        
        btn.frame = CGRectMake(i * btnWith, 0, btnWith, self.frame.size.height);
        
        [self addSubview:btn];
        
        NSDictionary *item = itemArray[i];
        
        if (i == 0) {
            
            btn.seleted = YES;
            self.seletetItem = btn;
        }
        
        [btn setUpbuttonWithDict:item];
           
    }
   
    
}
- (void)btnClick:(UITapGestureRecognizer *)sender
{
    
    //选中的按钮
    if (self.seletetItem == (MiuButton *)sender.view) {
        return;
        
    }else{
        
        self.seletetItem.seleted = NO;
        
        self.seletetItem = (MiuButton *)sender.view;
        
        self.seletetItem.seleted = YES;
        
        [self.delegate ChangeControllerWithIndex:self.seletetItem.tag - 100];
    }
    
    [UIView animateWithDuration:0.07 animations:^{
        
        self.seletetItem.transform = CGAffineTransformMakeScale(self.ScaleRatio, self.ScaleRatio);
        
    }completion:^(BOOL finished) {
        
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        
        //放大缩小的倍数
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        anim.springBounciness = self.springBounciness;
        anim.springSpeed = self.springSpeed;
        anim.dynamicsMass = self.dynamicsMass;
        anim.dynamicsFriction = self.dynamicsFriction;
        anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
            if (finished) {
                NSLog(@"Animation finished!");
                [self.seletetItem.layer pop_removeAllAnimations];
            }
        };
        [self.seletetItem.layer pop_addAnimation:anim forKey:@"center"];
    }];
    
}


@end
