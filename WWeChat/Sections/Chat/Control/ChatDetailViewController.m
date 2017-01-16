//
//  ChatDetailViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/29.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "ChatDetailViewController.h"
#import "ChatCell.h"
#import "MessageModel.h"

@interface ChatDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ChatDetailViewController

- (instancetype)init {
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.title = _conversationModel.title;
    [self getData];
    [self createUI];
}

- (void)getData {
    _datas = [NSMutableArray array];
    for (int i = 0; i < 50; i++) {
        MessageModel * model = [MessageModel new];
        model.isSelf = (i % 2 == 0);
        model.content = arc4random()%100 > 50 ? @"Hello!": @"Hello world Hello world Hello world Hello world Hello world Hello world Hello world";
        model.avaterUrl = @"default_avater";
        [_datas addObject:model];
    }
}

- (void)createUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = BASE_BACKGROUND_COLOR;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[ChatCell class] forCellReuseIdentifier:@"ChatCell"];
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [((ChatCell *)cell) setModel:_datas[indexPath.row]];
}

#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageModel * model = _datas[indexPath.row];
    return model.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"ChatCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
