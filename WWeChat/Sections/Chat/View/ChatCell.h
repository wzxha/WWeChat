//
//  ChatCell.h
//  WWeChat
//
//  Created by WzxJiang on 17/1/16.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface ChatCell : UITableViewCell

@property (nonatomic, strong) MessageModel * model;

@property (nonatomic, strong) UIImageView * avaterImgView;

@property (nonatomic, strong) UIImageView * bubbleView;

@property (nonatomic, strong) UILabel * contentLabel;

@end
