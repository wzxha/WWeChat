//
//  BaseViewController.h
//  WWeChat
//
//  Created by WzxJiang on 16/12/28.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)setRightBarButtonItemWithImageName:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action;

@end
