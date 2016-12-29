//
//  LoginViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/6/28.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginContentView.h"
#import "WZXLines.h"

@interface LoginViewController ()

@end

@implementation LoginViewController {
    LoginContentView * _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}
- (void)createUI {
    _contentView = [[LoginContentView alloc]init];
    [self.view addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(330));
    }];
    [_contentView.loginBtn addTarget:self action:@selector(deafultLogin) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * questionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [questionBtn addTarget:self action:@selector(toQuestion) forControlEvents:UIControlEventTouchUpInside];
    [questionBtn setTitle:@"登录遇到问题?" forState:UIControlStateNormal];
    [questionBtn setTitleColor:kRGB(142, 148, 165) forState:UIControlStateNormal];
    questionBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [questionBtn wzx_addLineWithDirection:WZXLineDirectionRight type:WZXLineTypeShort lineWidth:0.5];
    [self.view addSubview:questionBtn];
    [questionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-30);
        make.left.equalTo(self.view);
        make.height.equalTo(@(30));
    }];
    
    UIButton * otherLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [otherLoginBtn addTarget:self action:@selector(otherLogin) forControlEvents:UIControlEventTouchUpInside];
    [otherLoginBtn setTitle:@"其他登录方式" forState:UIControlStateNormal];
    [otherLoginBtn setTitleColor:kRGB(142, 148, 165) forState:UIControlStateNormal];
    otherLoginBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:otherLoginBtn];
    [otherLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-30);
        make.left.equalTo(questionBtn.mas_right);
        make.right.equalTo(self.view);
        make.width.equalTo(questionBtn);
        make.height.equalTo(@(30));
    }];
    
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:BASE_COLOR forState:UIControlStateNormal];
    [self.view addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(30);
        make.left.equalTo(self.view).offset(10);
        make.width.equalTo(@(40));
        make.height.equalTo(@(30));
    }];

}

#pragma mark - actions

- (void)deafultLogin {
    [self.view endEditing:YES];
   
}

- (void)cancel {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)toQuestion {
    
}

- (void)otherLogin {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
