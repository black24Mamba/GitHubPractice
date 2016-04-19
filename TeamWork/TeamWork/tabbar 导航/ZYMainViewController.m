//
//  ZYMainViewController.m
//  TeamWork
//
//  Created by 章鱼 on 16/3/15.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "ZYMainViewController.h"

@interface ZYMainViewController ()

@end

@implementation ZYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *titleScroll = [[UIScrollView alloc]init];
    titleScroll.sd_layout.heightIs(40).widthIs(self.view.width).centerXIs(self.view.size.width/2).centerXIs(self.view.size.height/2);
//    titleScroll.contentSize = CGSizeMake(600, 40);
    titleScroll.backgroundColor = [UIColor redColor];
    [self.view addSubview:titleScroll];
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
