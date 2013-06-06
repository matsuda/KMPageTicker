//
//  KMPageTicker.h
//  KMPageTicker
//
//  Created by Kosuke Matsuda on 2013/06/05.
//  Copyright (c) 2013年 matsuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KMPageTickerDataSource;


@interface KMPageTicker : UIView

@property (strong, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) id <KMPageTickerDataSource> dataSource;
@property (assign, nonatomic) CGSize itemSize;

- (void)reloadPageTicker;

@end

@protocol KMPageTickerDataSource <NSObject>

- (NSInteger)numberOfItemsInPageTicker:(KMPageTicker *)pageTicker;
- (UIView *)pageTicker:(KMPageTicker *)pageTicker viewAtIndex:(NSInteger)index;

@end
