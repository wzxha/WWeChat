//
//  AddressViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressBookCell.h"
#import "AddressCell.h"
#import "AddressBookModel.h"
#import "SearchCell.h"
#import "SearchViewController.h"

@interface AddressViewController () <UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) NSMutableArray <NSArray <AddressBookModel *> *> * datas;

@property (nonatomic, strong) NSMutableArray * indexTitles;

@property (nonatomic, weak) WZXSearchBar * searchBar;

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self getData];
    [self createUI];
}

- (void)getData {
    dispatch_async(dispatch_queue_create("WZX_ADDRESS_QUEUE", NULL), ^{
        _datas = [NSMutableArray array];
        _indexTitles = [NSMutableArray arrayWithObject:UITableViewIndexSearch];
        
        AddressBookModel * model1 = [AddressBookModel new];
        model1.name = @"wzxjiang";
        model1.imgUrl = @"default_avater";
        AddressBookModel * model2 = [AddressBookModel new];
        model2.name = @"jiang";
        model2.imgUrl = @"default_avater";
        AddressBookModel * model3 = [AddressBookModel new];
        model3.name = @"wzxjiang";
        model3.imgUrl = @"default_avater";
        AddressBookModel * model4 = [AddressBookModel new];
        model4.name = @"@wzxjiang";
        model4.imgUrl = @"default_avater";
        
        NSArray * models = @[model1, model2, model3, model4];
        NSMutableArray * otherModels = [NSMutableArray arrayWithArray:models];
        
        for (char ch = 'A'; ch <= 'Z'; ch++) {
            NSString * indexTitle = [NSString stringWithFormat:@"%c", ch];
            NSMutableArray * indexs = [NSMutableArray array];
            for (AddressBookModel * model in models) {
                if ([model.indexTitle isEqualToString: indexTitle]) {
                    [indexs addObject:model];
                    [otherModels removeObject:model];
                }
            }
            if (indexs.count > 0) {
                [_indexTitles addObject:indexTitle];
                [_datas addObject: indexs];
            }
        }
        
        if (otherModels.count > 0) {
            [_indexTitles addObject:@"#"];
            [_datas addObject:otherModels];
        }
        
        [self refreshTableView];
    });
}

- (void)refreshTableView {
    kDispatch_async_main_queue(^{
        [_tableView reloadData];
    });
}

- (void)createUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = BASE_BACKGROUND_COLOR;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    _tableView.sectionIndexColor = kRGB(82, 82, 82);
    [_tableView registerClass:[AddressCell class] forCellReuseIdentifier:@"AddressCell"];
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
            AddressCell * addressCell = (AddressCell *)cell;
            addressCell.titleLabel.text = [self tableTitles][indexPath.row];
            addressCell.imgView.image   = [UIImage imageNamed:[self tableImages][indexPath.row]];
        } else {
            _searchBar = ((SearchCell *) cell).searchBar;
            [_searchBar addTarget:self action:@selector(toSearchViewController) forControlEvents:UIControlEventTouchUpInside];
        }
    } else {
        // 通讯录好友
        [((AddressBookCell *)cell) setModel:_datas[indexPath.section - 1][indexPath.row]];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 && indexPath.section == 0) {
        return 45;
    } else {
        return 50;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
        label.text = [NSString stringWithFormat:@"   %@", _indexTitles[section]];
        label.font = [UIFont boldSystemFontOfSize:10];
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = kRGB(141, 141, 146);
        return label;
    }
    return nil;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return _indexTitles;
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
    return _datas[section - 1].count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _indexTitles.count;
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
