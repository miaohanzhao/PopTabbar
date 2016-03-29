//
//  MiuTabBarController.h
//  pod
//
//  Created by Miu on 16/3/16.
//  Copyright © 2016年 DD. All rights reserved.
//
#import "MiuTabBar.h"
#import <UIKit/UIKit.h>

@interface MiuTabBarController : UITabBarController
@property (nonatomic,strong)  MiuTabBar *Miutabbar;

+ (MiuTabBarController *)initWithControllerItme:(NSArray *)itemsArray;

@end
