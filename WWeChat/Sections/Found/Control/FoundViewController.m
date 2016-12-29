//
//  FoundViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "FoundViewController.h"

@interface FoundViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 45;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FoundCell"];
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [self tableTitles][indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self tableImages][indexPath.section][indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"FoundCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self tableTitles][section].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self tableTitles].count;
}

#pragma mark - data
- (NSArray <NSArray *> *)tableTitles {
    return @[@[@"朋友圈"],
             @[@"扫一扫",
               @"摇一摇"],
             @[@"附近的人"],
             @[@"购物", @"游戏"]];
};

- (NSArray <NSArray *> *)tableImages {
    return @[@[@"found_quan"],
             @[@"found_saoyisao",
               @"found_yao",],
             @[@"found_nearby"],
             @[@"found_shop",
               @"found_game"]];
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
