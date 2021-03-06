//
//  LFEmptyView.h
//  LFEmptyViewDemo
//
//  Created by ios开发 on 2018/1/3.
//  Copyright © 2018年 ios开发. All rights reserved.
//

#import "LFEmptyBaseView.h"

@interface LFEmptyView : LFEmptyBaseView

/*
 内容物上每个子控件之间的间距 默认是 20.0f
 */
@property (nonatomic,assign) CGFloat subViewMargin;
/*内容物 垂直方向偏移  (此属性与contentViewY 互斥 只有一个会有效) */
@property (nonatomic,assign) CGFloat contentViewOffset;
/**
 内容物-Y坐标 (此属性与contentViewOffset 互斥，只有一个会有效)
 */
@property (nonatomic, assign) CGFloat  contentViewY;

/*图片可设置固定大小*/
@property (nonatomic,assign) CGSize imageSize;

//标题字体 大小默认16.0f
@property (nonatomic,strong) UIFont *titleLabFont;
//标题文字颜色
@property (nonatomic,strong) UIColor *titleLabTextColor;

/**
 详细描述字体，大小default is 14.f
 */
@property (nonatomic, strong) UIFont   *detailLabFont;
/**
 详细描述最大行数， default is 2
 */
@property (nonatomic, assign) NSInteger detailLabMaxLines;
/**
 详细描述文字颜色
 */
@property (nonatomic, strong) UIColor  *detailLabTextColor;


///Button
/**
 按钮字体, 大小default is 14.f
 */
@property (nonatomic, strong) UIFont  *actionBtnFont;
/**
 按钮的高度, default is 40.f
 */
@property (nonatomic, assign) CGFloat  actionBtnHeight;
/**
 水平方向内边距, default is 30.f
 */
@property (nonatomic, assign) CGFloat  actionBtnHorizontalMargin;
/**
 按钮的圆角大小, default is 5.f
 */
@property (nonatomic, assign) CGFloat  actionBtnCornerRadius;
/**
 按钮边框border的宽度, default is 0
 */
@property (nonatomic, assign) CGFloat  actionBtnBorderWidth;
/**
 按钮边框颜色
 */
@property (nonatomic, strong) UIColor  *actionBtnBorderColor;
/**
 按钮文字颜色
 */
@property (nonatomic, strong) UIColor  *actionBtnTitleColor;
/**
 按钮背景颜色
 */
@property (nonatomic, strong) UIColor  *actionBtnBackGroundColor;

@end
