//
//  ConversationCell.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "ConversationCell.h"

@implementation ConversationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    _avaterView = [UIImageView new];
    [_avaterView wzx_addCornerRadius:2 clipsToBounds:YES];
    [self.contentView addSubview:_avaterView];
    [_avaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    
    _headLabel = [UILabel new];
    _headLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_headLabel];
    [_headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_avaterView).offset(-45/4.0);
        make.left.equalTo(_avaterView.mas_right).offset(8);
    }];
    
    _messageLabel = [UILabel new];
    _messageLabel.font = [UIFont systemFontOfSize:13];
    _messageLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_messageLabel];
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_avaterView).offset(45/4.0);
        make.left.equalTo(_headLabel);
    }];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.font = [UIFont systemFontOfSize:10];
    self.timeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-5);
    }];
}

- (void)setModel:(ConversationModel *)model {    
    _avaterView.image = [UIImage imageNamed:@"default_avater"];
    _headLabel.text = model.title;
    _messageLabel.text = model.lastMessage;
    _timeLabel.text = @"waiting";
}



@end
