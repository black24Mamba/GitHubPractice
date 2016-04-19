//
//  PlayerToolView.h
//  TeamWork
//
//  Created by 章鱼 on 16/3/17.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@protocol VideoPlayViewDelegate <NSObject>

- (void)videoPlayViewSwitchOrientation:(BOOL)isFull;

@end
@interface PlayerToolView : UIView
@property(nonatomic,weak)id<VideoPlayViewDelegate> delegate;
@property(nonatomic,strong)AVPlayerItem *playerItem;
@end
