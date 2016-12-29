//
//  TabBarController.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "TabBarController.h"
#import "ChatViewController.h"
#import "AddressViewController.h"
#import "FoundViewController.h"
#import "SettingViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    self.tabBar.tintColor = BASE_COLOR;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ChatViewController * chatVC = [ChatViewController new];
    chatVC.title = @"微信";
    
    AddressViewController * addressVC = [AddressViewController new];
    addressVC.title = @"通讯录";
    
    FoundViewController * foundVC = [FoundViewController new];
    foundVC.title = @"发现";
    
    SettingViewController * settingVC = [SettingViewController new];
    settingVC.title = @"我";

    self.viewControllers =
  @[[self navigationControllerWithViewController:chatVC imgName:@"tabbar_mainframe"],
    [self navigationControllerWithViewController:addressVC imgName:@"tabbar_contacts"],
    [self navigationControllerWithViewController:foundVC imgName:@"tabbar_discover"],
    [self navigationControllerWithViewController:settingVC imgName:@"tabbar_me"]];
}

- (UINavigationController *)navigationControllerWithViewController:(UIViewController *)vc imgName:(NSString *)imgName {
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:vc.title
                                                  image:
                      [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                          selectedImage:
                      [[UIImage imageNamed: [NSString stringWithFormat:@"%@HL", imgName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    return nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
