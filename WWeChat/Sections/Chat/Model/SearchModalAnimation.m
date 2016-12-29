//
//  SearchModalAnimation.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/29.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "SearchModalAnimation.h"
#import "ChatViewController.h"
#import "SearchViewController.h"

@implementation SearchModalAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController * toViewController =
    [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController * fromViewController =
    [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if ([fromViewController isKindOfClass:[NSClassFromString(@"TabBarController") class]]) {
        // present
        [self presentAniamtionWithTransition:transitionContext
                          chatViewController:(ChatViewController *)fromViewController
                        searchViewController:(SearchViewController *)toViewController];
    } else {
        // dismiss
        [self dismissAniamtionWithTransition:transitionContext
                          chatViewController:(ChatViewController *)toViewController
                        searchViewController:(SearchViewController *)fromViewController];
    }
}

- (void)presentAniamtionWithTransition:(id<UIViewControllerContextTransitioning>)transitionContext
                    chatViewController:(ChatViewController *)chatViewController
                  searchViewController:(SearchViewController *)searchViewController {
    searchViewController.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    searchViewController.view.alpha = 0;
    [[transitionContext containerView] addSubview:searchViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        searchViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)dismissAniamtionWithTransition:(id<UIViewControllerContextTransitioning>)transitionContext
                    chatViewController:(ChatViewController *)chatViewController
                  searchViewController:(SearchViewController *)searchViewController {
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        searchViewController.view.alpha = 0;
    } completion:^(BOOL finished) {
        [searchViewController.view removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

@end
