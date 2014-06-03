//
//  xh_parallaxScrollViews.h
//  xh_2scrollView
//
//  Created by Xiaohe Hu on 6/3/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xh_parallaxScrollViews : UIView <UIScrollViewDelegate> {
    NSArray         *arr_topContentViews;
    NSArray         *arr_btmContentViews;
}

@property (nonatomic, strong) UIScrollView          *uis_topScrlView;
@property (nonatomic, strong) UIScrollView          *uis_btmScrlView;


- (id)initWithFrame:(CGRect)frame andViewArray:(NSArray *) arr_views;

@end
