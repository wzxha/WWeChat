//
//  MeCell.m
//  WWeChat
//
//  Created by WzxJiang on 16/6/28.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "MeCell.h"

@implementation MeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    _avaterView = [UIImageView new];
    _avaterView.image = [UIImage imageNamed:@"default_avater"];
    [self.contentView addSubview:_avaterView];
    [_avaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(12);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    _nameLabel = [UILabel new];
    _nameLabel.text = @"username";
    _nameLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaterView.mas_right).offset(12);
        make.centerY.equalTo(self.contentView).offset(-10);
    }];
    
    _idLabel = [UILabel new];
    _idLabel.text = @"微信号: wzxjiang";
    _idLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_idLabel];
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaterView.mas_right).offset(12);
        make.centerY.equalTo(self.contentView).offset(10);
    }];
    
    UIImageView * qrImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setting_myQR"]];
    [self.contentView addSubview:qrImageView];
    [qrImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
    }];
}

@end
