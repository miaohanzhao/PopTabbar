//
//  MiuTabBarController.m
//  pod
//
//  Created by Miu on 16/3/16.
//  Copyright © 2016年. All rights reserved.
//

#import "MiuTabBarController.h"

@interface MiuTabBarController ()<MiutabbarProtocol>



@end

@implementation MiuTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
   //移除tarbar上的按钮
    for (id obj in self.tabBar.subviews) {
        
        if ([obj isKindOfClass:[UIControl class]]) {
            [obj removeFromSuperview];
            
        }
        
    }
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    
       self.Miutabbar = [[MiuTabBar alloc]initWithFrame:self.tabBar.bounds];
       self.Miutabbar.delegate = self;
       [self.tabBar addSubview:self.Miutabbar];
        
        
    }
    return self;
}


+ (MiuTabBarController *)initWithControllerItme:(NSArray *)itemsArray
{
    MiuTabBarController *new = [[MiuTabBarController alloc]init];
    
    //创建item
    [new.Miutabbar SetupItemsWithItem:itemsArray];
    
    for (id item in itemsArray) {
        //创建类
        if ([item isKindOfClass:[NSDictionary class]]) {
            
        [item enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
          UIViewController *vc = [[NSClassFromString(key) alloc]init];
          UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
           vc.title = key;
           nav.navigationBar.translucent = NO;
          [new addChildViewController:nav];
            
        }];
            
      }
  }
    
    return new;
}

- (void)ChangeControllerWithIndex:(NSInteger)index
{
    self.selectedIndex = index;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
