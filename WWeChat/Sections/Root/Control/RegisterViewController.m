//
//  RegisterViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/6/28.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterContentView.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController {
    RegisterContentView *_contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}

- (void)createUI {
    _contentView = [RegisterContentView new];
    [self.view addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@(330));
    }];
    [_contentView.registerBtn addTarget:self action:@selector(toRegister) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * desLabel = [UILabel new];
    desLabel.text = @"轻触上面的“注册”按钮，即表示你同意";
    desLabel.font = [UIFont systemFontOfSize:11];
    desLabel.textColor = kRGB(142, 148, 165);
    desLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:desLabel];
    [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-36);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
    
    UIButton * regulationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [regulationBtn addTarget:self action:@selector(toRegulation) forControlEvents:UIControlEventTouchUpInside];
    [regulationBtn setTitle:@"《微信软件许可及服务协议》" forState:UIControlStateNormal];
    [regulationBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    regulationBtn.titleLabel.font = [UIFont systemFontOfSize:9];
    [self.view addSubview:regulationBtn];
    [regulationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desLabel.mas_bottom);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@(20));
    }];

    // 取消按钮
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

- (void)toRegister {
    [self.view endEditing:YES];
}

- (void)toRegulation {
    
}

- (void)cancel {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
