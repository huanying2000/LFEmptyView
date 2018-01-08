//
//  UIView+Extension.h
//  LFEmptyViewDemo
//
//  Created by ios开发 on 2018/1/3.
//  Copyright © 2018年 ios开发. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)


@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
@property (nonatomic,assign) CGSize lf_size;
@property (nonatomic,assign) CGPoint lf_origin;
@property (nonatomic,assign,readonly) CGFloat maxX;
@property (nonatomic,assign,readonly) CGFloat maxY;


@end
