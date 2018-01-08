//
//  UIScrollView+Empty.m
//  LFEmptyViewDemo
//
//  Created by ios开发 on 2018/1/3.
//  Copyright © 2018年 ios开发. All rights reserved.
//

#import "UIScrollView+Empty.h"
#import <objc/runtime.h>
#import "LFEmptyView.h"



@implementation UIScrollView (Empty)

#pragma mark - Setter/Getter
static char kEmptyViewKey;
//用RunTime 给ScrollView添加空白页
- (void)setLf_emptyView:(LFEmptyView *)lf_emptyView {
    NSLog(@"setLf_emptyView:%@", lf_emptyView);
    if (lf_emptyView != self.lf_emptyView) {
        objc_setAssociatedObject(self, &kEmptyViewKey, lf_emptyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[LFEmptyView class]]) {
                [view removeFromSuperview];
            }
        }
        NSLog(@"setLf_emptyView:%@", self.lf_emptyView);
        [self addSubview:self.lf_emptyView];
    }
}

- (LFEmptyView *)lf_emptyView {
    return objc_getAssociatedObject(self, &kEmptyViewKey);
}

#pragma mark - private Method
- (NSInteger) totalDataCount {
    NSInteger totalCount = 0;
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)self;
        for (NSInteger section = 0; section < tableView.numberOfSections; section ++) {
            totalCount += [tableView numberOfRowsInSection:section];
        }
    }else if ([self isKindOfClass:[UICollectionView class]]) {
        UICollectionView *collectionView = (UICollectionView *)self;
        
        for (NSInteger section = 0; section < collectionView.numberOfSections; section++) {
            totalCount += [collectionView numberOfItemsInSection:section];
        }
    }
    return totalCount;
}

- (void)getDataAndSet {
    if ([self totalDataCount] == 0) {
        [self show];
    }else{
        [self hide];
    }
}



- (void)show {
    //当不自动显隐时，内部自动调用show方法时也不要去显示，要显示的话只有手动去调用 lf_showEmptyView
    if (!self.lf_emptyView.autoShowEmptyView) {
        self.lf_emptyView.hidden = YES;
        return;
    }
    
    [self lf_showEmptyView];
}


- (void)hide{
    
    if (!self.lf_emptyView.autoShowEmptyView) {
        self.lf_emptyView.hidden = YES;
        return;
    }
    
    [self lf_hideEmptyView];
}

#pragma mark - Public Method
- (void)lf_showEmptyView{
    
    [self.lf_emptyView.superview layoutSubviews];
    
    self.lf_emptyView.hidden = NO;
    //让 emptyBGView 始终保持在最上层
    [self bringSubviewToFront:self.lf_emptyView];
}
- (void)lf_hideEmptyView{
    self.lf_emptyView.hidden = YES;
}

- (void)lf_startLoading{
    self.lf_emptyView.hidden = YES;
}
- (void)lf_endLoading{
    if ([self totalDataCount] == 0) {
        self.lf_emptyView.hidden = NO;
    }else{
        self.lf_emptyView.hidden = YES;
    }
}
@end


@implementation UITableView (Empty)

+ (void)load {
    Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
    Method lf_reloadData = class_getInstanceMethod(self, @selector(lf_reloadData));
    method_exchangeImplementations(reloadData, lf_reloadData);
    
    ///section
    Method insertSections = class_getInstanceMethod(self, @selector(insertSections:withRowAnimation:));
    Method lf_insertSections = class_getInstanceMethod(self, @selector(lf_insertSections:withRowAnimation:));
    method_exchangeImplementations(insertSections, lf_insertSections);
    
    Method deleteSections = class_getInstanceMethod(self, @selector(deleteSections:withRowAnimation:));
    Method lf_deleteSections = class_getInstanceMethod(self, @selector(lf_deleteSections:withRowAnimation:));
    method_exchangeImplementations(deleteSections, lf_deleteSections);
    
    ///row
    Method insertRowsAtIndexPaths = class_getInstanceMethod(self, @selector(insertRowsAtIndexPaths:withRowAnimation:));
    Method lf_insertRowsAtIndexPaths = class_getInstanceMethod(self, @selector(lf_insertRowsAtIndexPaths:withRowAnimation:));
    method_exchangeImplementations(insertRowsAtIndexPaths, lf_insertRowsAtIndexPaths);
    
    Method deleteRowsAtIndexPaths = class_getInstanceMethod(self, @selector(deleteRowsAtIndexPaths:withRowAnimation:));
    Method lf_deleteRowsAtIndexPaths = class_getInstanceMethod(self, @selector(lf_deleteRowsAtIndexPaths:withRowAnimation:));
    method_exchangeImplementations(deleteRowsAtIndexPaths, lf_deleteRowsAtIndexPaths);
    
}


- (void)lf_reloadData{
    [self lf_reloadData];
    [self getDataAndSet];
}

///section
- (void)lf_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self lf_insertSections:sections withRowAnimation:animation];
    [self getDataAndSet];
}
- (void)lf_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    [self lf_insertSections:sections withRowAnimation:animation];
    [self getDataAndSet];
}

///row
- (void)lf_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self lf_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getDataAndSet];
}
- (void)lf_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self lf_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [self getDataAndSet];
}

@end

@implementation UICollectionView (Empty)
+ (void)load{
    
    Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
    Method lf_reloadData = class_getInstanceMethod(self, @selector(lf_reloadData));
    method_exchangeImplementations(reloadData, lf_reloadData);
    
    ///section
    Method insertSections = class_getInstanceMethod(self, @selector(insertSections:));
    Method lf_insertSections = class_getInstanceMethod(self, @selector(lf_insertSections:));
    method_exchangeImplementations(insertSections, lf_insertSections);
    
    Method deleteSections = class_getInstanceMethod(self, @selector(deleteSections:));
    Method lf_deleteSections = class_getInstanceMethod(self, @selector(lf_deleteSections:));
    method_exchangeImplementations(deleteSections, lf_deleteSections);
    
    ///item
    Method insertItemsAtIndexPaths = class_getInstanceMethod(self, @selector(insertItemsAtIndexPaths:));
    Method lf_insertItemsAtIndexPaths = class_getInstanceMethod(self, @selector(lf_insertItemsAtIndexPaths:));
    method_exchangeImplementations(insertItemsAtIndexPaths, lf_insertItemsAtIndexPaths);
    
    Method deleteItemsAtIndexPaths = class_getInstanceMethod(self, @selector(deleteItemsAtIndexPaths:));
    Method lf_deleteItemsAtIndexPaths = class_getInstanceMethod(self, @selector(lf_deleteItemsAtIndexPaths:));
    method_exchangeImplementations(deleteItemsAtIndexPaths, lf_deleteItemsAtIndexPaths);
    
}
- (void)lf_reloadData{
    [self lf_reloadData];
    [self getDataAndSet];
}
///section
- (void)lf_insertSections:(NSIndexSet *)sections{
    [self lf_insertSections:sections];
    [self getDataAndSet];
}
- (void)lf_deleteSections:(NSIndexSet *)sections{
    [self lf_deleteSections:sections];
    [self getDataAndSet];
}
///item
- (void)lf_insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self lf_insertItemsAtIndexPaths:indexPaths];
    [self getDataAndSet];
}
- (void)lf_deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    [self lf_deleteItemsAtIndexPaths:indexPaths];
    [self getDataAndSet];
}
@end



