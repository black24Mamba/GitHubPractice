//
//  ZYtabBarViewController.m
//  TeamWork
//
//  Created by 章鱼 on 16/3/15.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "ZYtabBarViewController.h"
#import "ZYMainViewController.h"
#import "ZYTableViewController.h"
#import "AVPlayerViewController.h"
@interface ZYtabBarViewController ()

@end

@implementation ZYtabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    ZYTableViewController *z = [[ZYTableViewController alloc]init];
//    UINavigationController *zNC = [[UINavigationController alloc]initWithRootViewController:z];
//    zNC.navigationItem.title = @"减肥资讯";
//    zNC.tabBarItem.title = @"减肥资讯";
//    ZYMainViewController *z = [[ZYMainViewController alloc]init];
    AVPlayerViewController *z = [AVPlayerViewController new];
        UINavigationController *zNC = [[UINavigationController alloc]initWithRootViewController:z];
    self.viewControllers = [NSArray arrayWithObject:zNC];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
