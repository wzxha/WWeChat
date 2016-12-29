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
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchButton.userInteractionEnabled = NO;
    _searchButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    [_searchButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:_searchButton];
    [_searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
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
