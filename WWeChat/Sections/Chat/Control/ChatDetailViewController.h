//
//  ChatDetailViewController.h
//  WWeChat
//
//  Created by WzxJiang on 16/12/29.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "BaseViewController.h"
#import "ConversationModel.h"

@interface ChatDetailViewController : BaseViewController

@property (nonatomic, strong) ConversationModel * conversationModel;

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * datas;

@end
