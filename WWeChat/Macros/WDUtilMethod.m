//
//  WDUtilMethod.m
//  WDLib
//
//  Created by WzxJiang on 16/7/27.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "WDUtilMethod.h"
#import "WDMacro.h"

void kDispatch_async_main_queue(dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}
void kDispatch_sync_main_queue(dispatch_block_t block) {
    dispatch_sync(dispatch_get_main_queue(), block);
}

//MARK: - 比例
CGFloat kScaleHeight(CGFloat height) {
    return ([UIScreen mainScreen].bounds.size.height/568.f) * height;
}

CGFloat kScaleWidth(CGFloat width) {
    return ([UIScreen mainScreen].bounds.size.width/320.f) * width;
}

//MARK: - 机型判断
BOOL kIsPhone4() {
    return (kScreenHeight == 480)&&(kScreenWidth == 320);
}

BOOL kIsPhone5() {
    return (kScreenHeight == 568)&&(kScreenWidth == 320);
}

BOOL kIsPhone6() {
    return (kScreenHeight == 667)&&(kScreenWidth == 375);
}

BOOL kIsPhone6p() {
    return (kScreenHeight == 736)&&(kScreenWidth == 414);
}

id kPhoneValue(id iPhone4, id iPhone5, id iPhone6, id iPhone6p) {
    if (kIsPhone6p()) {
        return iPhone6p;
    } else if (kIsPhone6()) {
        return iPhone6;
    } else if (kIsPhone5()) {
        return iPhone5;
    } else if (kIsPhone4()) {
        return iPhone4;
    } else {
        return iPhone6p;
    }
}
