//
//  UIView+Extension.m
//  LFEmptyViewDemo
//
//  Created by ios开发 on 2018/1/3.
//  Copyright © 2018年 ios开发. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}


- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat)y {
    return self.frame.origin.y;
}


- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat) centerX {
    return self.center.x;
}


- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}


- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setLf_size:(CGSize)lf_size {
    CGRect frame = self.frame;
    frame.size = lf_size;
    self.frame = frame;
}

- (CGSize)lf_size {
    return self.frame.size;
}

- (void)setLf_origin:(CGPoint)lf_origin {
    CGRect frame = self.frame;
    frame.origin = lf_origin;
    self.frame = frame;

}

- (CGPoint) lf_origin {
    return self.frame.origin;
}


- (CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)maxY{
    return self.frame.origin.y + self.frame.size.height;
}














@end
