//
//  WDLibMacro.h
//  WDLib
//
//  Created by WzxJiang on 16/7/26.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#ifndef WDMacro_h
#define WDMacro_h

//MARK: - 屏幕尺寸
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
#define kScreenHeight           [UIScreen mainScreen].bounds.size.height
#define kScreenBounds           [UIScreen mainScreen].bounds

//MARK: - 
#define kUserDefaults           [NSUserDefaults standardUserDefaults]
#define kApplication            [UIApplication sharedApplication]
#define kNotificationCenter     [NSNotificationCenter defaultCenter]

//MARK: - color
#define UIColorFromRGB(rgbValue)                                   \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                green:((float)((rgbValue & 0xFF00) >> 8))/255.0    \
                 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]  \

#define kRGBA(r, g, b, a)                                          \
[UIColor colorWithRed:r/255.0                                      \
                green:g/255.0                                      \
                 blue:b/255.0 alpha:a]                             \

#define kRGB(r, g, b) kRGBA(r, g, b, 1)


//MARK: - weakify strongify
#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

#endif /* WDMacro_h */
