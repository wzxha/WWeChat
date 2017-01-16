//
//  ChatCell.m
//  WWeChat
//
//  Created by WzxJiang on 17/1/16.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

#import "ChatCell.h"

@implementation ChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    _avaterImgView = [UIImageView new];
    [self.contentView addSubview:_avaterImgView];
    
    _bubbleView = [UIImageView new];
    [self.contentView addSubview:_bubbleView];
    
    _contentLabel = [UILabel new];
    _contentLabel.backgroundColor = [UIColor clearColor];
    _contentLabel.font = [UIFont systemFontOfSize:16];
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
}

- (void)setModel:(MessageModel *)model {
    if ([_model.content isEqualToString:model.content] &&
        [_model.avaterUrl isEqualToString:model.avaterUrl] &&
        _model.isSelf == model.isSelf) {
        return;
    }
    
    _model = model;
    
    _contentLabel.text = model.content;
    _avaterImgView.image = [UIImage imageNamed:model.avaterUrl];
    
    if (model.isSelf) {
        // 是自己
        [_avaterImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-5);
            make.size.mas_equalTo(CGSizeMake(35, 35));
            make.top.equalTo(self.contentView).offset(5);
        }];
        
        _bubbleView.image =
        [[UIImage imageNamed:@"SenderTextNodeBkg"] stretchableImageWithLeftCapWidth:50 topCapHeight:30];
        
        [_bubbleView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_avaterImgView.mas_left).offset(-5);
            make.top.equalTo(_avaterImgView);
            make.size.mas_equalTo(model.size);
        }];

        [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_bubbleView).offset(-5);
            make.left.equalTo(_bubbleView).offset(8);
            make.right.equalTo(_bubbleView).offset(-10);
        }];
    } else {
        [_avaterImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(5);
            make.size.mas_equalTo(CGSizeMake(35, 35));
            make.top.equalTo(self.contentView).offset(5);
        }];
        
        _bubbleView.image =
        [[UIImage imageNamed:@"ReceiverTextNodeBkg"] stretchableImageWithLeftCapWidth:50 topCapHeight:30];
        
        [_bubbleView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avaterImgView.mas_right).offset(5);
            make.top.equalTo(_avaterImgView);
            make.size.mas_equalTo(model.size);
        }];
        
        [_contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_bubbleView).offset(-5);
            make.left.equalTo(_bubbleView).offset(10);
            make.right.equalTo(_bubbleView).offset(-8);
        }];
    }
}

@end
