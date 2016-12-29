//
//  WDUtilMethod.h
//  WDLib
//
//  Created by WzxJiang on 16/7/27.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

//MARK: - 线程
void kDispatch_async_main_queue(dispatch_block_t block);
void kDispatch_sync_main_queue(dispatch_block_t block);

//MARK: - 比例
CGFloat kScaleHeight(CGFloat height);
CGFloat kScaleWidth(CGFloat width);

//MARK: - 机型判断
BOOL kIsPhone4();
BOOL kIsPhone5();
BOOL kIsPhone6();
BOOL kIsPhone6p();

id kPhoneValue(id iPhone4, id iPhone5, id iPhone6, id iPhone6p);
