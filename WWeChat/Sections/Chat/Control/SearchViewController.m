//
//  SearchViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/29.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (instancetype)init {
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI {
    self.view.backgroundColor = [BASE_BACKGROUND_COLOR colorWithAlphaComponent:0.8];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
