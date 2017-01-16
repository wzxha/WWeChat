//
//  MessageModel.h
//  WWeChat
//
//  Created by WzxJiang on 17/1/16.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic, assign) BOOL isSelf;

@property (nonatomic, copy) NSString * content;

@property (nonatomic, copy) NSString * avaterUrl;

@property (nonatomic, assign) CGSize size;

@end
