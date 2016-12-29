//
//  RootViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([KeyChain password].length > 0 &&
        [KeyChain account].length > 0) {
        // 自动登录
    } else {
        [self createUI];
    }
}

- (void)createUI {
    UIImageView * backgroundView =
    [[UIImageView alloc] initWithImage: [UIImage imageNamed:
                                         kPhoneValue(@"Launch4",
                                                     @"Launch5",
                                                     @"Launch6",
                                                     @"Launch6p")]];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    
    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor whiteColor]];
    [loginBtn wzx_addCornerRadius:4 clipsToBounds:YES];
    [loginBtn addTarget:self action:@selector(toLoginViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@45);
        make.width.equalTo(self.view).multipliedBy(0.5).offset(-40);
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    
    
    UIButton * registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn setBackgroundColor:BASE_COLOR];
    [registerBtn wzx_addCornerRadius:4 clipsToBounds:YES];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(toRegisterViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@45);
        make.width.equalTo(self.view).multipliedBy(0.5).offset(-40);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
}

#pragma mark - actions

- (void)toLoginViewController {
    [self presentViewController:[NSClassFromString(@"LoginViewController") new] animated:YES completion:nil];
}

- (void)toRegisterViewController {
    [self presentViewController:[NSClassFromString(@"RegisterViewController") new] animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
