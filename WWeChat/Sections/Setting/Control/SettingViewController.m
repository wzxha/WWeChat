//
//  SettingViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "SettingViewController.h"
#import "MeCell.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)createUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SettingCell"];
    [_tableView registerClass:[MeCell class] forCellReuseIdentifier:@"MeCell"];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 87;
    } else {
        return 45;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [tableView dequeueReusableCellWithIdentifier:@"MeCell"];
    } else {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self tableTitles][section].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self tableTitles].count;
}


#pragma mark - data
- (NSArray <NSArray *> *)tableTitles {
    return @[@[@""],
             @[@"相册",
               @"收藏",
               @"钱包",
               @"卡券"],
             @[@"表情"],
             @[@"设置"]];
};

- (NSArray <NSArray *> *)tableImages {
    return @[@[@""],
             @[@"me_photo",
               @"me_collect",
               @"me_money",
               @"me_collect"],
             @[@"MoreExpressionShops"],
             @[@"me_setting"]];
};


@end
