//
//  WZXSearchBar.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "WZXSearchBar.h"

@implementation WZXSearchBar

- (instancetype)init {
    if (self = [super init]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.backgroundColor = [UIColor whiteColor];
    [self wzx_addCornerRadius:3 clipsToBounds:YES];
    
    UILabel * textLabel = [UILabel new];
    textLabel.text = @"搜索";
    textLabel.font = [UIFont systemFontOfSize:13];
    textLabel.textColor = BASE_BACKGROUND_COLOR;
    [self addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    UIButton * speechBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self addSubview:speechBtn];
    [speechBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-10);
    }];
}

@end
