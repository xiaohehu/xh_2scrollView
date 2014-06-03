//
//  xh_parallaxScrollViews.m
//  xh_2scrollView
//
//  Created by Xiaohe Hu on 6/3/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import "xh_parallaxScrollViews.h"
#define kVeritcalBool YES

@implementation xh_parallaxScrollViews
@synthesize uis_btmScrlView, uis_topScrlView;

- (id)initWithFrame:(CGRect)frame andViewArray:(NSArray *) arr_views
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        arr_btmContentViews = [[NSArray alloc] initWithArray:arr_views[0]];
        arr_topContentViews = [[NSArray alloc] initWithArray:arr_views[1]];

        [self initScrollViews];
    }
    return self;
}

-(void)initScrollViews {
    // Init bottom scroll view
    uis_btmScrlView = [[UIScrollView alloc] initWithFrame:self.bounds];
    uis_btmScrlView.backgroundColor = [UIColor whiteColor];
    uis_btmScrlView.pagingEnabled = NO;
    uis_btmScrlView.showsHorizontalScrollIndicator = NO;
    uis_btmScrlView.showsVerticalScrollIndicator = NO;
    uis_btmScrlView.userInteractionEnabled = NO;
    
    if (kVeritcalBool) {
        uis_btmScrlView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height * (arr_btmContentViews.count));
        for (int i = 0; i < arr_btmContentViews.count; i++) {
            UIView *uiv_content = [[UIView alloc] init];
            uiv_content = arr_btmContentViews[i];
            uiv_content.frame = CGRectMake(0.0, self.bounds.size.height*i, self.bounds.size.width, self.bounds.size.height);
            [uis_btmScrlView addSubview: uiv_content];
        }
    }
    else {
        uis_btmScrlView.contentSize = CGSizeMake(self.bounds.size.width * (arr_btmContentViews.count), self.bounds.size.height);
        for (int i = 0; i < arr_btmContentViews.count; i++) {
            UIView *uiv_content = [[UIView alloc] init];
            uiv_content = arr_btmContentViews[i];
            uiv_content.frame = CGRectMake(self.bounds.size.width*i, 0.0, self.bounds.size.width, self.bounds.size.height);
            
            [uis_btmScrlView addSubview: uiv_content];
        }
    }
    [self addSubview: uis_btmScrlView];
    
    //Init top scroll view
    uis_topScrlView = [[UIScrollView alloc] initWithFrame:self.bounds];
    uis_topScrlView.backgroundColor = [UIColor clearColor];
    uis_topScrlView.pagingEnabled = YES;
    uis_topScrlView.showsVerticalScrollIndicator = NO;
    uis_topScrlView.showsHorizontalScrollIndicator = NO;
    uis_topScrlView.delegate = self;
    
    if (kVeritcalBool) {
        uis_topScrlView.contentSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height * (arr_topContentViews.count));
        for (int i = 0; i < arr_topContentViews.count; i++) {
            UIView *uiv_content = [[UIView alloc] init];
            uiv_content = arr_topContentViews[i];
            uiv_content.frame = CGRectMake(0.0, self.bounds.size.height*i, self.bounds.size.width, self.bounds.size.height);
            
            [uis_topScrlView addSubview: uiv_content];
        }
    }
    else {
        uis_topScrlView.contentSize = CGSizeMake(self.bounds.size.width * (arr_topContentViews.count), self.bounds.size.height);
        for (int i = 0; i < arr_topContentViews.count; i++) {
            UIView *uiv_content = [[UIView alloc] init];
            uiv_content = arr_topContentViews[i];
            uiv_content.frame = CGRectMake(self.bounds.size.width*i, 0.0, self.bounds.size.width, self.bounds.size.height);
            
            [uis_topScrlView addSubview: uiv_content];
        }

    }
    [self addSubview: uis_topScrlView];
}

#pragma mark - Scroll View Delegate Methods
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (kVeritcalBool) {
        CGPoint offset = uis_btmScrlView.contentOffset;
        offset.y = uis_topScrlView.contentOffset.y * (float)(arr_btmContentViews.count - 1) / (float)(arr_topContentViews.count - 1) ;
        [uis_btmScrlView setContentOffset:offset];
    }
    else {
        CGPoint offset = uis_btmScrlView.contentOffset;
        offset.x = uis_topScrlView.contentOffset.x * (float)arr_btmContentViews.count / (float)arr_topContentViews.count;
        [uis_btmScrlView setContentOffset:offset];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
