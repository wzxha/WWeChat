//
//  ChatViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "ChatViewController.h"
#import "ConversationCell.h"
#import "ConversationModel.h"
#import "SearchViewController.h"
#import "ChatDetailViewController.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) UISearchController * searchController;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self getData];
    [self createUI];
}

- (void)getData {
    _datas = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++) {
        ConversationModel * model = [ConversationModel new];
        model.title = @"标题";
        model.lastMessage = @"消息";
        [_datas addObject:model];
    }
}

- (void)createUI {
//    [self setRightBarButtonItemWithImageName:@"" target:self action:@selector(rightButtonClick:)];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = BASE_BACKGROUND_COLOR;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    [_tableView registerClass:[ConversationCell class] forCellReuseIdentifier:@"ConversationCell"];
    [self.view addSubview:_tableView];
    
    _searchController =
    [[UISearchController alloc] initWithSearchResultsController:[SearchViewController new]];
    _searchController.searchBar.barStyle = UIBarStyleDefault;
    _searchController.searchBar.barTintColor = BASE_BACKGROUND_COLOR;
    _searchController.searchBar.tintColor = BASE_COLOR;
    _searchController.searchBar.translucent = YES;
    _searchController.searchBar.delegate = self;
    _searchController.hidesBottomBarWhenPushed = YES;
    CGRect rect = _searchController.searchBar.frame;
    rect.size.height = 44;
    _searchController.searchBar.frame = rect;
    self.tableView.tableHeaderView = _searchController.searchBar;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatDetailViewController * chatDetailViewController = [ChatDetailViewController new];
    chatDetailViewController.conversationModel = _datas[indexPath.row];
    [self.navigationController pushViewController:chatDetailViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [((ConversationCell *)cell) setModel:_datas[indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"ConversationCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.navigationController.tabBarController.tabBar.hidden = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    self.navigationController.tabBarController.tabBar.hidden = NO;
}

#pragma mark - actions

- (void)rightButtonClick:(id)sender {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
