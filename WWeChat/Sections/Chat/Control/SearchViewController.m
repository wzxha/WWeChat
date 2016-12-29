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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView * topView = [UIView new];
    topView.backgroundColor = BASE_BACKGROUND_COLOR;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@64);
    }];
    
    _searchBar = [UISearchBar new];
    _searchBar.tintColor = BASE_COLOR;
    _searchBar.barTintColor = BASE_BACKGROUND_COLOR;
    _searchBar.placeholder = @"搜索";
    [_searchBar setBackgroundImage:[UIImage new]];
    [topView addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(topView);
        make.height.equalTo(@40);
        make.left.equalTo(topView);
    }];
    [_searchBar becomeFirstResponder];
    
    UIButton * cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:BASE_COLOR forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:cancelButton];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_searchBar);
        make.right.equalTo(topView).offset(-10);
        make.left.equalTo(_searchBar.mas_right).offset(10);
    }];
}


#pragma mark - actions 
- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
