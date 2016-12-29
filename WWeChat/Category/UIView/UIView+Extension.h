//
//  UIView+WDExtension.h
//  PopOn
//
//  Created by WzxJiang on 16/6/17.
//  Copyright © 2016年 wordoor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property(nonatomic,assign)CGPoint wzx_origin;

@property(nonatomic,assign)CGFloat wzx_origin_x;

@property(nonatomic,assign)CGFloat wzx_origin_y;


@property(nonatomic,assign)CGSize  wzx_size;

@property(nonatomic,assign)CGFloat wzx_size_width;

@property(nonatomic,assign)CGFloat wzx_size_height;

- (void)wzx_addShadow:(UIColor *)shadowColor
              Offset:(CGSize)shadowOffset
              Radius:(CGFloat)shadowRadius
             Opacity:(CGFloat)shadowOpacity;

- (void)wzx_addCornerRadius:(CGFloat)cornerRadius clipsToBounds:(BOOL)isClipsToBounds;
@end
