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
#import "SearchCell.h"
#import "SearchViewController.h"

@interface ChatViewController () <UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate>

@property (nonatomic, weak) WZXSearchBar * searchBar;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self getData];
    [self createUI];
}

- (void)getData {
    _datas = [NSMutableArray arrayWithObject:@""];
    
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        [((ConversationCell *)cell) setModel:_datas[indexPath.row]];
    } else {
        _searchBar = ((SearchCell *)cell).searchBar;
        [_searchBar addTarget:self action:@selector(toSearchViewController) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 45;
    } else {
        return 60;
    }
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
    return _datas.count;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [NSClassFromString(@"SearchModalAnimation") new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    if ([dismissed isKindOfClass:[SearchViewController class]]) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [_searchBar.searchButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_searchBar);
        }];
        [UIView animateWithDuration:0.3 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
    return [NSClassFromString(@"SearchModalAnimation") new];
}

#pragma mark - actions

- (void)rightButtonClick:(id)sender {

}

- (void)toSearchViewController {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [_searchBar.searchButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_searchBar);
        make.centerY.equalTo(_searchBar);
    }];
    [UIView animateWithDuration:0.1 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    SearchViewController * searchViewController = [SearchViewController new];
    searchViewController.modalPresentationStyle = UIModalPresentationCustom;
    searchViewController.transitioningDelegate  = self;
    [self presentViewController:searchViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
