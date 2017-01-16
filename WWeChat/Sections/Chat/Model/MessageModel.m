//
//  MessageModel.m
//  WWeChat
//
//  Created by WzxJiang on 17/1/16.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

- (void)setContent:(NSString *)content {
    _content = content;
    CGSize textSize =
    [content boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:nil].size;
    
    _size = CGSizeMake(textSize.width, textSize.height + 40);
    
    if (_size.height < 45) {
        _size = CGSizeMake(_size.width, 45);
    }
    
    if (_size.width < 60) {
        _size = CGSizeMake(60, _size.height);
    }
    
}

@end
