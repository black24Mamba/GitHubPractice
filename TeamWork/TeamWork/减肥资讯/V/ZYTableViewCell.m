//
//  ZYTableViewCell.m
//  Test
//
//  Created by 章鱼 on 16/3/15.
//  Copyright © 2016年 章鱼. All rights reserved.
//

#import "ZYTableViewCell.h"

@implementation ZYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self allViews];
    }
    return  self;
}
- (void)allViews{

    self.imageview = [[UIImageView alloc]init];
    self.imageview.layer.masksToBounds = YES;
    self.imageview.layer.cornerRadius = 20;
    [self.contentView addSubview:self.imageview];

    self.tLabel = [UILabel new];
    self.tLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:self.tLabel];
    
    self.detailLabel = [UILabel new];
     self.detailLabel.font = [UIFont systemFontOfSize:15];
    self.detailLabel.textColor = [UIColor lightGrayColor];
     [self.contentView addSubview:self.detailLabel];
    /**  SDAutoLayout */
    self.imageview.sd_layout.leftSpaceToView(self.contentView,10).topSpaceToView(self.contentView,10).widthIs(90).heightIs(90);
    self.tLabel.sd_layout.leftSpaceToView(self.imageview,20).topSpaceToView(self.contentView,15).rightSpaceToView(self.contentView,20).autoHeightRatio(0);
    self.detailLabel.sd_layout.leftSpaceToView(self.imageview,20).bottomSpaceToView(self.contentView,10).rightSpaceToView(self.contentView,20).heightIs(15);
     [self setupAutoHeightWithBottomView:self.imageview bottomMargin:10];
}


@end
