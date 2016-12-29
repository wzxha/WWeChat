//
//  ChatViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "ChatViewController.h"
#import "ConversationCell.h"
#import "SearchCell.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
    [self createUI];
}

- (void)setUp {
    _datas = [NSMutableArray array];
}

- (void)getData {
    [_datas addObject:@10];
}

- (void)createUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[SearchCell class] forCellReuseIdentifier:@"SearchCell"];
    [_tableView registerClass:[ConversationCell class] forCellReuseIdentifier:@"ConversationCell"];
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        // 搜索
    } else {
    
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    } else {
        return [tableView dequeueReusableCellWithIdentifier:@"ConversationCell"];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count + 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
