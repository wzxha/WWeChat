//
//  BaseViewController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)init {
    if (self = [super init]) {
        [self super_setUp];
    }
    return self;
}

- (void)super_setUp {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];

    UIBarButtonItem * backbutton = [UIBarButtonItem new];
    backbutton.title = @"返回";
    self.navigationItem.backBarButtonItem = backbutton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (void)setRightBarButtonItemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

@end
