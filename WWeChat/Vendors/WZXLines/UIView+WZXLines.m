//
//  UIView+WZXLines.m
//  WZXLines
//
//  Created by WzxJiang on 16/6/6.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "UIView+WZXLines.h"
#define WZX_Line_Short_Scale 0.5
@implementation UIView (WZXLines)

- (void)wzx_addLineWithDirection:(WZXLineDirection)direction
                            type:(WZXLineType)type
                       lineWidth:(CGFloat)lineWidth
                       lineColor:(UIColor *)lineColor {
    if((direction & WZXLineDirectionTop))  {
        [self addTopLineForType:type lineWidth:lineWidth lineColor:lineColor];
    }
    
    if((direction & WZXLineDirectionBottom)) {
        [self addBottomLineForType:type lineWidth:lineWidth lineColor:lineColor];
    }
    
    if((direction & WZXLineDirectionLeft)) {
        [self addLeftLineForType:type lineWidth:lineWidth lineColor:lineColor];
    }
    
    if((direction & WZXLineDirectionRight)) {
        [self addRightLineForType:type lineWidth:lineWidth lineColor:lineColor];
    }
}

- (void)addLeftLineForType:(WZXLineType)type lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor{
    if (self.frame.size.width == 0 &&
        self.frame.size.height == 0) {
        UIView * lineView = [self _createLineView:lineColor];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (type == WZXLineTypeFill) {
                make.width.equalTo(@(lineWidth));
                make.left.equalTo(self).offset(-lineWidth/2.0);
                make.centerY.equalTo(self);
                make.height.equalTo(self);
            } else if (type == WZXLineTypeShort) {
                make.width.equalTo(@(lineWidth));
                make.left.equalTo(self).offset(-lineWidth/2.0);
                make.centerY.equalTo(self);
                make.height.equalTo(self).multipliedBy(WZX_Line_Short_Scale);
            }
        }];
        
    } else {
        UIBezierPath * path = [UIBezierPath bezierPath];
        
        if (type & WZXLineTypeFill) {
            [path moveToPoint:CGPointMake(0, 0)];
            [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
        } else if (type & WZXLineTypeShort) {
            CGFloat space = (self.frame.size.height * (1 - WZX_Line_Short_Scale))/2.0;
            [path moveToPoint:CGPointMake(0, space)];
            [path addLineToPoint:CGPointMake(0, self.frame.size.height - space)];
        }
        
        CAShapeLayer * borderLayer = [self setShapeLayerWithType:type lineWidth:lineWidth lineColor:lineColor];
        borderLayer.path = path.CGPath;
        borderLayer.lineWidth = lineWidth;
        [self.layer addSublayer:borderLayer];
    }
}

- (void)addRightLineForType:(WZXLineType)type lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor {
    if (self.frame.size.width == 0 &&
        self.frame.size.height == 0) {
        UIView * lineView = [self _createLineView:lineColor];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (type == WZXLineTypeFill) {
                make.width.equalTo(@(lineWidth));
                make.right.equalTo(self).offset(lineWidth/2.0);
                make.centerY.equalTo(self);
                make.height.equalTo(self);
            } else if (type == WZXLineTypeShort) {
                make.width.equalTo(@(lineWidth));
                make.right.equalTo(self).offset(lineWidth/2.0);
                make.centerY.equalTo(self);
                make.height.equalTo(self).multipliedBy(WZX_Line_Short_Scale);
            }
        }];
    } else {
        UIBezierPath * path = [UIBezierPath bezierPath];
        
        if (type & WZXLineTypeFill) {
            [path moveToPoint:CGPointMake(self.frame.size.width, 0)];
            [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        } else if (type & WZXLineTypeShort) {
            CGFloat space = (self.frame.size.height * (1 - WZX_Line_Short_Scale))/2.0;
            [path moveToPoint:CGPointMake(self.frame.size.width, space)];
            [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height - space)];
        }
        
        CAShapeLayer * borderLayer = [self setShapeLayerWithType:type lineWidth:lineWidth lineColor:lineColor];
        borderLayer.path = path.CGPath;
        borderLayer.lineWidth = lineWidth;
        [self.layer addSublayer:borderLayer];
    }
}

- (void)addTopLineForType:(WZXLineType)type lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor {
    if (self.frame.size.width == 0 &&
        self.frame.size.height == 0) {
        UIView * lineView = [self _createLineView:lineColor];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (type == WZXLineTypeFill) {
                make.width.equalTo(self);
                make.top.equalTo(self).offset(-lineWidth/2.0);
                make.centerX.equalTo(self);
                make.height.equalTo(@(lineWidth));
            } else if (type == WZXLineTypeShort) {
                make.width.equalTo(self).multipliedBy(WZX_Line_Short_Scale);
                make.top.equalTo(self).offset(-lineWidth/2.0);
                make.centerX.equalTo(self);
                make.height.equalTo(@(lineWidth));
            }
        }];
    } else {
        UIBezierPath * path = [UIBezierPath bezierPath];
        
        if (type & WZXLineTypeFill) {
            [path moveToPoint:CGPointMake(0, 0)];
            [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
        } else if (type & WZXLineTypeShort) {
            CGFloat space = (self.frame.size.height * (1 - WZX_Line_Short_Scale))/2.0;
            [path moveToPoint:CGPointMake(space, 0)];
            [path addLineToPoint:CGPointMake(self.frame.size.width - space, 0)];
        }
        
        CAShapeLayer * borderLayer = [self setShapeLayerWithType:type lineWidth:lineWidth lineColor:lineColor];
        borderLayer.path = path.CGPath;
        borderLayer.lineWidth = lineWidth;
        [self.layer addSublayer:borderLayer];
    }
}

- (void)addBottomLineForType:(WZXLineType)type lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor {
    if (self.frame.size.width == 0 &&
        self.frame.size.height == 0) {
        UIView * lineView = [self _createLineView:lineColor];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (type == WZXLineTypeFill) {
                make.width.equalTo(self);
                make.bottom.equalTo(self).offset(lineWidth/2.0);
                make.centerX.equalTo(self);
                make.height.equalTo(@(lineWidth));
            } else if (type == WZXLineTypeShort) {
                make.width.equalTo(self).multipliedBy(WZX_Line_Short_Scale);
                make.bottom.equalTo(self).offset(lineWidth/2.0);
                make.centerX.equalTo(self);
                make.height.equalTo(@(lineWidth));
            }
        }];
    } else {
        UIBezierPath * path = [UIBezierPath bezierPath];
        
        if (type & WZXLineTypeFill) {
            [path moveToPoint:CGPointMake(0, self.frame.size.height)];
            [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        } else if (type & WZXLineTypeShort) {
            CGFloat space = (self.frame.size.height * (1 - WZX_Line_Short_Scale))/2.0;
            [path moveToPoint:CGPointMake(space, self.frame.size.height)];
            [path addLineToPoint:CGPointMake(self.frame.size.width - space, self.frame.size.height)];
        }
        
        CAShapeLayer * borderLayer = [self setShapeLayerWithType:type lineWidth:lineWidth lineColor:lineColor];
        borderLayer.path = path.CGPath;
        borderLayer.lineWidth = lineWidth;
        [self.layer addSublayer:borderLayer];
    }
}

- (CAShapeLayer *)setShapeLayerWithType:(WZXLineType)type
                    lineWidth:(CGFloat)lineWidth
                    lineColor:(UIColor *)lineColor {
    CAShapeLayer * borderLayer = [CAShapeLayer layer];
    borderLayer.fillColor   = lineColor.CGColor;
    borderLayer.strokeColor = lineColor.CGColor;
    borderLayer.lineWidth = lineWidth;
    if ((type & WZXLineTypeDotted)) {
        //虚线边框
        borderLayer.lineDashPattern = @[@8, @8];
    } else {
        //实线边框
        borderLayer.lineDashPattern = nil;
    }
    return borderLayer;
}


- (void)wzx_addLineWithDirection:(WZXLineDirection)direction
                            type:(WZXLineType)type
                       lineWidth:(CGFloat)lineWidth {
    [self wzx_addLineWithDirection:direction type:type lineWidth:lineWidth lineColor:UIColorFromRGB(0xcccccc)];
}

- (void)wzx_addLineWithDirection:(WZXLineDirection)direction
                       lineWidth:(CGFloat)lineWidth {
    [self wzx_addLineWithDirection:direction type:WZXLineTypeFill lineWidth:lineWidth lineColor:[UIColor blackColor]];
}

- (void)wzx_addLineWithDirection:(WZXLineDirection)direction {
    [self wzx_addLineWithDirection:direction type:WZXLineTypeFill lineWidth:2 lineColor:[UIColor blackColor]];
}

- (UIView *)_createLineView:(UIColor *)color {
    UIView * lineView = [[UIView alloc]init];
    lineView.backgroundColor = color;
    return lineView;
}
@end
