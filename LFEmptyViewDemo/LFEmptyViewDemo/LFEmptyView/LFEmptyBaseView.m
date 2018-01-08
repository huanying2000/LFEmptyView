//
//  LFEmptyBaseView.m
//  LFEmptyViewDemo
//
//  Created by ios开发 on 2018/1/3.
//  Copyright © 2018年 ios开发. All rights reserved.
//

#import "LFEmptyBaseView.h"

@implementation LFEmptyBaseView

- (instancetype) init {
    self = [super init];
    if (self) {
        self.autoShowEmptyView = YES;
        [self prepare];
    }
    return self;
}

- (void)prepare {
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth
    | UIViewAutoresizingFlexibleHeight;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIView *view = self.superview;
    //不是ScrollView 不做操作
    if (view && [view isKindOfClass:[UIScrollView class]]) {
        self.width = view.width;
        self.height = view.height;
    }
    [self setupSubViews];
}

- (void)setupSubViews {
    
}

/*
 // 当视图添加子视图时调用
 
 - (void)didAddSubview:(UIView *)subview;
 
 
 // 当子视图从本视图移除时调用
 
 - (void)willRemoveSubview:(UIView *)subview;
 
 
 // 当视图即将加入父视图时 / 当视图即将从父视图移除时调用
 
 - (void)willMoveToSuperview:(nullable UIView *)newSuperview;
 
 
 // 当试图加入父视图时 / 当视图从父视图移除时调用
 
 - (void)didMoveToSuperview;
 
 
 // 当视图即将加入父视图时 / 当视图即将从父视图移除时调用
 
 - (void)willMoveToWindow:(nullable UIWindow *)newWindow;
 
 
 // 当视图加入父视图时 / 当视图从父视图移除时调用
 
 - (void)didMoveToWindow;
 */
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    //不是从ScrollView 不做操作
    if (newSuperview && [newSuperview isKindOfClass:[UIScrollView class]]) {
        return;
    }
    if (newSuperview) {
        self.width = newSuperview.width;
        self.height = newSuperview.height;
    }
}

//创建一个空视图
+ (instancetype) emptyActionViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action {
    LFEmptyBaseView *emptyView = [[self alloc] init];
   
    [emptyView creatEmptyViewWithImageStr:imageStr titleStr:titleStr detailStr:detailStr btnTitleStr:btnTitleStr target:target action:action];
    
    return  emptyView;
}


+ (instancetype) emptyActionViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr btnClickBlock:(LFActionTapBlock)btnClickBlock {
    LFEmptyBaseView *emptyView = [[self alloc] init];
    
    [emptyView creatEmptyViewWithImageStr:imageStr titleStr:titleStr detailStr:detailStr btnTitleStr:btnTitleStr btnClickBlock:btnClickBlock];
    
    return emptyView;
}


+ (instancetype) emptyViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr {
    LFEmptyBaseView *emptyView = [[self alloc] init];
    
    [emptyView creatEmptyViewWithImageStr:imageStr titleStr:titleStr detailStr:detailStr btnTitleStr:nil btnClickBlock:nil];
    
    return emptyView;
}


+ (instancetype)emptyViewWithCustomView:(UIView *)customView{
    
    LFEmptyBaseView *emptyView = [[self alloc] init];
    
    [emptyView creatEmptyViewWithCustomView:customView];
    
    return emptyView;
}


- (void)creatEmptyViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr target:(id)target action:(SEL)action {
    _imageStr = imageStr;
    _titleStr = titleStr;
    _detailStr = detailStr;
    _btnTitleStr = btnTitleStr;
    _actionBtnTarget = target;
    _actionBtnAction = action;
    
    //内容物背景视图
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame: CGRectZero];
        [self addSubview:_contentView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContentView:)];
        [_contentView addGestureRecognizer:tap];
    }
}

- (void)creatEmptyViewWithImageStr:(NSString *)imageStr titleStr:(NSString *)titleStr detailStr:(NSString *)detailStr btnTitleStr:(NSString *)btnTitleStr btnClickBlock:(LFActionTapBlock)btnClickBlock{
    
    _imageStr = imageStr;
    _titleStr = titleStr;
    _detailStr = detailStr;
    _btnTitleStr = btnTitleStr;
    _btnClickBlock = btnClickBlock;
    
    //内容物背景视图
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_contentView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContentView:)];
        [_contentView addGestureRecognizer:tap];
    }
}

- (void)creatEmptyViewWithCustomView:(UIView *)customView{
    
    //内容物背景视图
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:_contentView];
    }
    
    if (!_customView) {
        [_contentView addSubview:customView];
    }
    _customView = customView;
}


-(void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    [self setupSubViews];
}
- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
   [self setupSubViews];
}
- (void)setDetailStr:(NSString *)detailStr{
    _detailStr = detailStr;
    [self setupSubViews];
}
- (void)setBtnTitleStr:(NSString *)btnTitleStr{
    _btnTitleStr = btnTitleStr;
    [self setupSubViews];
}

- (void)tapContentView:(UITapGestureRecognizer *)tap{
    if (_tapContentViewBlock) {
        _tapContentViewBlock();
    }
}




@end
