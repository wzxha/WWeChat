//
//  ConversationCell.h
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConversationModel.h"

@interface ConversationCell : UITableViewCell

@property (nonatomic, strong) UIImageView * avaterView;

@property (nonatomic, strong) UILabel * headLabel;

@property (nonatomic, strong) UILabel * messageLabel;

@property (nonatomic, strong) UILabel * timeLabel;

- (void)setModel:(ConversationModel *)model;

@end
