//
//  PlayerToolView.m
//  TeamWork
//
//  Created by 章鱼 on 16/3/17.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "PlayerToolView.h"
#import <AVFoundation/AVFoundation.h>
@interface PlayerToolView ()
@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)AVPlayerLayer *playerLayer;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIView *toolView;
@property(nonatomic,assign)BOOL isShowToolView;
@property(nonatomic,strong)NSTimer *progressTimer;
@property(nonatomic,strong)UISlider *progressSlider;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIButton *playOrPauseBtn;
@property(nonatomic,strong)UIButton *fullScreenBtn;
@end
@implementation PlayerToolView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self allViews];
    }
    return self;
}
- (void)layoutSubviews{
   [super layoutSubviews];
   self.playerLayer.frame = self.bounds;
}
- (void)allViews{
    self.player = [[AVPlayer alloc]init];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
   
    self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
   self.imageView.userInteractionEnabled = YES;
    [self.imageView.layer addSublayer:self.playerLayer];
    [self addSubview:self.imageView];
   // self.imageView的约束
   self.imageView.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self,0).bottomSpaceToView(self,0);
   
   //控制条
    self.toolView = [[UIView alloc]init];
    self.toolView.alpha = 0;
      [self.imageView addSubview:self.toolView];
//   toolView的约束
  
    self.isShowToolView = NO;
   //播放暂停按钮
    self.playOrPauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   [self.playOrPauseBtn setBackgroundImage:[UIImage imageNamed:@"iconfont-bofang"] forState:UIControlStateNormal];
   [self.playOrPauseBtn setBackgroundImage:[UIImage imageNamed:@"iconfont-bofang(1)"] forState:UIControlStateSelected];
   [self.playOrPauseBtn addTarget:self action:@selector(playOrPause:) forControlEvents:UIControlEventTouchUpInside];
    self.playOrPauseBtn.selected = YES;
       [self.toolView addSubview:self.playOrPauseBtn];
    //进度条
     self.progressSlider = [[UISlider alloc]init];
   [self.progressSlider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
    [self.toolView addSubview:self.progressSlider];
 
// 时间标签
   self.timeLabel = [[UILabel alloc]init];
   [self.toolView addSubview:self.timeLabel];
   //全屏播放按钮
   self.fullScreenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   [self.fullScreenBtn setBackgroundImage:[UIImage imageNamed:@"123123"] forState:UIControlStateNormal];
   [self.fullScreenBtn setBackgroundImage:[UIImage imageNamed:@"iconfont-tuichuquanping(1)"] forState:UIControlStateSelected];
   [self.fullScreenBtn addTarget:self action:@selector(fullScreenBtn:) forControlEvents:UIControlEventTouchUpInside];
   [self.toolView addSubview:self.fullScreenBtn];

   
    self.toolView.sd_layout.leftSpaceToView(self.imageView,0).rightSpaceToView(self.imageView,0).bottomSpaceToView(self.imageView,0).heightIs(50);

   self.playOrPauseBtn.sd_layout.widthIs(30).heightIs(30).leftSpaceToView(self.toolView,10).bottomSpaceToView(self.toolView,10);

    self.progressSlider.sd_layout.leftSpaceToView(self.playOrPauseBtn,20).bottomSpaceToView(self.toolView,10).topSpaceToView(self.toolView,10).rightSpaceToView(self.toolView,170);

    self.timeLabel.sd_layout.leftSpaceToView(self.progressSlider,10).bottomSpaceToView(self.toolView,10).widthIs(100).heightIs(30).rightSpaceToView(self.toolView,60);


   
   self.fullScreenBtn.sd_layout.rightSpaceToView(self.toolView,10).bottomSpaceToView(self.toolView,10).widthIs(30).heightIs(30);
  

    [self removeProgressTimer];
     [self addProgressTimer];
   //添加手势
   UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
   [self.imageView addGestureRecognizer:tap];
}
/** 添加计时器 */
- (void)addProgressTimer{
   self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressInfo) userInfo:nil repeats:YES];
   [[NSRunLoop mainRunLoop]addTimer:self.progressTimer forMode:NSRunLoopCommonModes];
}
/** 移除计时器 */
- (void)removeProgressTimer{
   [self.progressTimer invalidate];
   self.progressTimer = nil;
}
//计时器开始 更新
- (void)updateProgressInfo{
   //  1.更新时间
   self.timeLabel.text = [self timestring];
   // 2. 设置进度条的value
   self.progressSlider.value = CMTimeGetSeconds(self.player.currentTime) / CMTimeGetSeconds(self.player.currentItem.duration);
}
//计算时间
- (NSString *)timestring{
   NSTimeInterval duration =  CMTimeGetSeconds(self.player.currentItem.duration);
   NSTimeInterval currentTime = CMTimeGetSeconds(self.player.currentTime);
   NSString *durationString = [NSString stringWithFormat:@"%02ld:%02ld",(NSInteger)duration / 60,(NSInteger)duration % 60];
   NSString *currentString = [NSString stringWithFormat:@"%02ld:%02ld",(NSInteger)currentTime / 60,(NSInteger)currentTime % 60];
   return [NSString stringWithFormat:@"%@/%@",currentString,durationString];
}
#pragma mark------------设置播放的视频
- (void)setPlayerItem:(AVPlayerItem *)playerItem{
   _playerItem = playerItem;
   [self.player replaceCurrentItemWithPlayerItem:playerItem];
   [self.player play];
}
//是否显示工具的toolView
- (void)tapAction:(UITapGestureRecognizer *)sender{
   [UIView animateWithDuration:0.5 animations:^{
      if (self.isShowToolView) {
         self.toolView.alpha = 0;
         self.isShowToolView = NO;
      }else{
         self.toolView.alpha = 1;
         self.isShowToolView = YES;
      }
   }];
}
/** 播放暂停 */
- (void)playOrPause:(UIButton *)sender{
   sender.selected = !sender.selected;
   if (sender.selected) {
      [self.player play];
      [self addProgressTimer];
   }else{
      [self.player pause];
      [self removeProgressTimer];
   }
}
/** 全屏播放按钮 */
- (void)fullScreenBtn:(UIButton *)sender{
   sender.selected = !sender.selected;
   if ([self.delegate respondsToSelector:@selector(videoPlayViewSwitchOrientation:)] || self.delegate != nil) {
      [self.delegate videoPlayViewSwitchOrientation:sender.selected];
   }
}
- (void)slider:(UISlider *)sender{
   [self setTime:sender.value];
}
- (void)setTime:(float)time{
   NSTimeInterval currentTime = CMTimeGetSeconds(self.player.currentItem.duration) * self.progressSlider.value;
   [self.player seekToTime:CMTimeMakeWithSeconds(currentTime, NSEC_PER_SEC) toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];
  
}
@end
