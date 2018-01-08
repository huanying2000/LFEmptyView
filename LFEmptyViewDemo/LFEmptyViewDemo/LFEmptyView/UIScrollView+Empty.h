//
//  UIScrollView+Empty.h
//  LFEmptyViewDemo
//
//  Created by ios开发 on 2018/1/3.
//  Copyright © 2018年 ios开发. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFEmptyView;

@interface UIScrollView (Empty)

@property (nonatomic, strong) LFEmptyView *lf_emptyView;


/******* 使用下面的四个方法最好将EmptyView的autoShowEmptyView值置为NO，关闭自动显隐，以保证不受自动显隐的影响 ****/

/**
 一般用于开始请求网络时调用，lf_startLoading调用时会暂时隐藏emptyView
 当调用lf_endLoading方法时，lf_endLoading方法内部会根据当前的tableView/collectionView的
 DataSource来自动判断是否显示emptyView
 */
- (void)lf_startLoading;

/**
 在想要刷新emptyView状态时调用
 注意:lf_endLoading 的调用时机，有刷新UI的地方一定要等到刷新UI的方法之后调用，
 因为只有刷新了UI，view的DataSource才会更新，故调用此方法才能正确判断是否有内容。
 */
- (void)lf_endLoading;


//调用下面两个手动显隐的方法，不受DataSource的影响，单独设置显示与隐藏（前提是关闭autoShowEmptyView）

/**
 手动调用显示emptyView
 */
- (void)lf_showEmptyView;

/**
 手动调用隐藏emptyView
 */
- (void)lf_hideEmptyView;

@end
