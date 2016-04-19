//
//  AVPlayerViewController.m
//  TeamWork
//
//  Created by 章鱼 on 16/3/17.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "AVPlayerViewController.h"
#import "FullScreenViewController.h"
#import "PlayerToolView.h"
@interface AVPlayerViewController ()<VideoPlayViewDelegate>
@property(nonatomic,strong)FullScreenViewController *fullVC;
@property(nonatomic,strong)PlayerToolView *playView;
@end

@implementation AVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpVideoPlayer];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://vss.waqu.com/x9b9pnlaev2jwrjw/normal.mp4"]];
    self.playView.playerItem = item;
}
- (void)setUpVideoPlayer{
    self.playView = [[PlayerToolView alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.width*9/16)];
    [self.view addSubview:self.playView];
    self.playView.delegate = self;

}
- (void)videoPlayViewSwitchOrientation:(BOOL)isFull{
    
    if (isFull) {
        [self presentViewController:self.fullVC animated:NO completion:^{
            self.playView.frame = self.fullVC.view.bounds;
            [self.fullVC.view addSubview:self.playView];
        }];
    }else{
        [self.fullVC dismissViewControllerAnimated:NO completion:^{
            self.playView.frame = CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.width*9/16);
            [self.view addSubview:self.playView];
        }];
    }
}
- (FullScreenViewController *)fullVC{
    if (_fullVC == nil) {
        self.fullVC = [[FullScreenViewController alloc]init];
    }
    return _fullVC;
}

#pragma mark------------------懒加载player
//- (AVPlayer *)player{
//    if (_player == nil) {
//        //1.获取url
//        NSURL *url = [NSURL URLWithString:@"http://vss.waqu.com/x9b9pnlaev2jwrjw/normal.mp4"];
//        //2.创建item
//        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
//        //3.创建AVPlayer
//        _player = [AVPlayer playerWithPlayerItem:item];
//        //4.添加AVPlayerlayer
//        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
//        layer.backgroundColor = [UIColor blackColor].CGColor;
//        layer.frame = CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.width*9/16);
//        self.layer = layer;
//        [self.view.layer addSublayer:self.layer];
//    }
//    return _player;
//}
//

@end
