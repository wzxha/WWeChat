//
//  UIView+WDExtension.m
//  PopOn
//
//  Created by WzxJiang on 16/6/17.
//  Copyright © 2016年 wordoor. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (CGPoint)wzx_origin {
    return self.frame.origin;
}

- (void)setWzx_origin:(CGPoint)wzx_origin {
    CGRect frame = self.frame;
    frame.origin = wzx_origin;
    self.frame = frame;
}


- (CGSize)wzx_size {
    return self.frame.size;
}

- (void)setWzx_size:(CGSize)wzx_size {
    CGRect frame = self.frame;
    frame.size = wzx_size;
    self.frame = frame;
}


- (CGFloat)wzx_origin_x {
    return self.frame.origin.x;
}

- (void)setWzx_origin_x:(CGFloat)wzx_x {
    CGRect frame = self.frame;
    frame.origin.x = wzx_x;
    self.frame = frame;
}


- (CGFloat)wzx_origin_y {
    return self.frame.origin.y;
}

- (void)setWzx_origin_y:(CGFloat)wzx_y {
    CGRect frame = self.frame;
    frame.origin.y = wzx_y;
    self.frame = frame;
}


- (CGFloat)wzx_size_width {
    return self.frame.size.width;
}

- (void)setWzx_size_width:(CGFloat)wzx_width {
    CGRect frame = self.frame;
    frame.size.width = wzx_width;
    self.frame = frame;
}


- (CGFloat)wzx_size_height {
    return self.frame.size.height;
}

- (void)setWzx_size_height:(CGFloat)wzx_height {
    CGRect frame = self.frame;
    frame.size.height = wzx_height;
    self.frame = frame;
}

- (void)wzx_addShadow:(UIColor *)shadowColor Offset:(CGSize)shadowOffset Radius:(CGFloat)shadowRadius Opacity:(CGFloat)shadowOpacity {
    self.layer.shadowColor   = shadowColor.CGColor;
    self.layer.shadowOffset  = shadowOffset;
    self.layer.shadowRadius  = shadowRadius;
    self.layer.shadowOpacity = shadowOpacity;
}

- (void)wzx_addCornerRadius:(CGFloat)cornerRadius clipsToBounds:(BOOL)isClipsToBounds {
    self.layer.cornerRadius = cornerRadius;
    self.clipsToBounds      = isClipsToBounds;
}
@end
