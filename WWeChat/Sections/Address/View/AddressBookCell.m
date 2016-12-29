//
//  AddressBookCell.m
//  WWeChat
//
//  Created by WzxJiang on 16/7/1.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "AddressBookCell.h"

@implementation AddressBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    _avaterView = [UIImageView new];
    _avaterView.image = [UIImage imageNamed:@"default_avater"];
    [self.contentView addSubview: _avaterView];
    [_avaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    _nickNameLabel = [UILabel new];
    _nickNameLabel.text = @"nickname";
    [self.contentView addSubview: _nickNameLabel];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(_avaterView.mas_right).offset(15);
    }];
}

@end
