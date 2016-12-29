//
//  ConversationModel.h
//  WWeChat
//
//  Created by WzxJiang on 16/12/29.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConversationModel : NSObject

@property (nonatomic, copy) NSString * conversationId;

@property (nonatomic, copy) NSString * title;

@property (nonatomic, copy) NSArray <NSString *> * imgUrls;

@property (nonatomic, copy) NSString * lastMessage;

@property (nonatomic, assign) NSUInteger unreadCount;

@property (nonatomic, assign) BOOL isTop;

@property (nonatomic, assign) NSTimeInterval timestamp;

@end
