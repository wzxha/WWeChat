//
//  AddressViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressBookCell.h"
#import "SearchCell.h"

@interface AddressViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation AddressViewController

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
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"AddressCell"];
    [_tableView registerClass:[AddressBookCell class]  forCellReuseIdentifier:@"AddressBookCell"];
    [_tableView registerClass:[SearchCell class] forCellReuseIdentifier:@"SearchCell"];
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row != 0) {
            cell.textLabel.text = [self tableTitles][indexPath.row];
            cell.imageView.image = [UIImage imageNamed:[self tableImages][indexPath.row]];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
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
        if (indexPath.row == 0) {
            return [tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
        } else {
            return [tableView dequeueReusableCellWithIdentifier:@"AddressCell"];
        }
    }
    return [tableView dequeueReusableCellWithIdentifier:@"AddressBookCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [self tableTitles].count;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 + 0;
}

#pragma mark - data
- (NSArray *)tableTitles {
    return @[@"",
             @"新的朋友",
             @"群聊",
             @"标签",
             @"公众号"];
};

- (NSArray *)tableImages {
    return @[@"",
             @"plugins_FriendNotify",
             @"add_friend_icon_addgroup",
             @"Contact_icon_ContactTag",
             @"add_friend_icon_offical"];};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
