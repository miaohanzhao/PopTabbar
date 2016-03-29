//
//  Me.m
//  pod
//
//  Created by Miu on 16/3/3.
//  Copyright © 2016年 DD. All rights reserved.
//

#import "Me.h"

@interface Me ()

@end

@implementation Me

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
       
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255 / 256.0f green:arc4random()%255 / 256.0f  blue:arc4random()%255 / 256.0f  alpha:1.0f];
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
