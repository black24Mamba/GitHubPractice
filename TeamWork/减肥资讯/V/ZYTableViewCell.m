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
    self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 100, 100)];
    [self.contentView addSubview:self.imageview];
    self.tLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 5, 240, 70)];
    self.tLabel.numberOfLines = 0;
    self.tLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:self.tLabel];
    self.detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 75, 200, 20)];
    [self.contentView addSubview:self.detailLabel];
     self.detailLabel.font = [UIFont systemFontOfSize:15];
    self.detailLabel.textColor = [UIColor lightGrayColor];
}


@end
