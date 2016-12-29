//
//  ThridPartService.m
//  PopOn
//
//  Created by wordoor－z on 16/4/6.
//  Copyright © 2016年 wzx. All rights reserved.
//

#import "ThridPartService.h"

@implementation ThridPartService

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[self class] initNav];
    });
}

+ (void)initNav {
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:54/255.0 green:53/255.0 blue:58/255.0 alpha:1]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}

@end
