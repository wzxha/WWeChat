//
//  UIView+WZXLines.h
//  WZXLines
//
//  Created by WzxJiang on 16/6/6.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WZXLineDirection) {
    WZXLineDirectionLeft   = 1 << 0,
    WZXLineDirectionRight  = 1 << 1,
    WZXLineDirectionTop    = 1 << 2,
    WZXLineDirectionBottom = 1 << 3
};

typedef NS_ENUM(NSInteger,WZXLineType) {
    // default
    WZXLineTypeFill    = 1 << 0,
    // 短一点的线 (70%)
    WZXLineTypeShort   = 1 << 1,
    // 虚线
    WZXLineTypeDotted  = 1 << 2
};

@interface UIView (WZXLines)

/**
 *  完整方法:
 *  direction 线的方向，可多选,
 *  type      线的样式，虚线可与其它多选,
 *  lineWidth 线的宽度,
 *  lineColor 线的颜色
 */
- (void)wzx_addLineWithDirection:(WZXLineDirection)direction
                            type:(WZXLineType)type
                       lineWidth:(CGFloat)lineWidth
                       lineColor:(UIColor *)lineColor;

/**
 *  默认线颜色(黑色)
 */
- (void)wzx_addLineWithDirection:(WZXLineDirection)direction
                            type:(WZXLineType)type
                       lineWidth:(CGFloat)lineWidth;

/** 
 *  默认线颜色(黑色),
 *  默认线样式(WZXLineTypeFill)
 */
- (void)wzx_addLineWithDirection:(WZXLineDirection)direction
                       lineWidth:(CGFloat)lineWidth; 

/** 
 *  默认线颜色(黑色),
 *  默认线样式(WZXLineTypeFill),
 *  默认线宽度(2)
 */
- (void)wzx_addLineWithDirection:(WZXLineDirection)direction;




@end
