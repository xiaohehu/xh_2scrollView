//
//  ViewController.m
//  xh_2scrollView
//
//  Created by Xiaohe Hu on 5/4/14.
//  Copyright (c) 2014 Xiaohe Hu. All rights reserved.
//

#import "ViewController.h"
#import "xh_parallaxScrollViews.h"
@interface ViewController ()

@property (nonatomic, strong) UIScrollView          *uis_bottomScrView;
@property (nonatomic, strong) UIScrollView          *uis_topScrView;
@property (nonatomic, strong) NSArray               *arr_images;
@property (nonatomic, strong) NSArray               *arr_images2;
@property (nonatomic, strong) NSArray               *arr_btmViews;
@property (nonatomic, strong) NSArray               *arr_topViews;
@property (nonatomic, strong) xh_parallaxScrollViews *parallaxView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.frame = CGRectMake(0.0, 0.0, 1024.0, 768.0);
    _arr_images = [[NSArray alloc] initWithObjects:@"image_1.png", @"image_2.png", @"image_3.png",@"image_4.png", @"image_5.png", @"image_6.png", nil];
    _arr_images2 = [[NSArray alloc] initWithObjects:@"parallax_bg_1.jpg", @"parallax_bg_2.jpg", nil];
//    [self initBottomScroll];
//    [self initTopScroll];
    [self initImageViews];
}

-(void)initImageViews {
    NSMutableArray *arr_top = [[NSMutableArray alloc] init];
    NSMutableArray *arr_btm = [[NSMutableArray alloc] init];
    for (int i = 0; i < _arr_images.count; i++) {
        UIImageView *tmp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_arr_images[i]]];
        UIView *uiv_tmp = [[UIView alloc] initWithFrame:self.view.bounds];
        [uiv_tmp addSubview: tmp];
        [arr_top addObject:uiv_tmp];
    }
    
    _arr_topViews = [[NSArray alloc] initWithArray:arr_top];
    
    for (int i = 0; i < _arr_images2.count; i++) {
        UIImageView *tmp = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_arr_images2[i]]];
        UIView *uiv_tmp = [[UIView alloc] initWithFrame:self.view.bounds];
        [uiv_tmp addSubview: tmp];
        [arr_btm addObject:uiv_tmp];
    }
    _arr_btmViews = [[NSArray alloc] initWithArray:arr_btm];
    
    [self initParalax];
}

-(void)initParalax  {
    NSArray *arr_allViews = [[NSArray alloc] initWithObjects:_arr_btmViews, _arr_topViews,nil];
    
    _parallaxView = [[xh_parallaxScrollViews alloc] initWithFrame:self.view.bounds andViewArray:arr_allViews];
    
    [self.view addSubview: _parallaxView];
}

//-(void)initBottomScroll {
//    _uis_bottomScrView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    _uis_bottomScrView.backgroundColor = [UIColor redColor];
//    _uis_bottomScrView.contentSize = CGSizeMake(1024, 768*3);
//    _uis_bottomScrView.pagingEnabled = NO;
//    _uis_bottomScrView.showsVerticalScrollIndicator = NO;
////    _uis_bottomScrView.delegate = self;
//    _uis_bottomScrView.userInteractionEnabled = NO;
//    
//    for (int i = 0; i < _arr_images.count; i++) {
//        UIImageView *contentImge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_arr_images objectAtIndex:i]]];
//        contentImge.frame = CGRectMake(0.0, 768*i, 1024, 768);
//        
//        [_uis_bottomScrView addSubview: contentImge];
//    }
//    [self.view addSubview:_uis_bottomScrView];
//}
//
//-(void)initTopScroll {
//    _uis_topScrView = [[UIScrollView alloc] initWithFrame:CGRectMake(662, 0.0, 100, 768)];
//    _uis_topScrView.backgroundColor = [UIColor whiteColor];
//    _uis_topScrView.contentSize = CGSizeMake(100, 768*3);
//    _uis_topScrView.pagingEnabled = NO;
//    _uis_topScrView.showsVerticalScrollIndicator = NO;
//    _uis_topScrView.delegate = self;
//    
//    for (int i = 0; i < _arr_images2.count; i++) {
//        UIImageView *contentImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_arr_images2 objectAtIndex:i]]];
//        contentImage.frame = CGRectMake(0.0, 768*i, 100, 768);
//        [_uis_topScrView addSubview: contentImage];
//    }
//    
//    [self.view insertSubview:_uis_topScrView aboveSubview:_uis_bottomScrView];
//}

//#pragma mark - Scroll View Delegate
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGPoint offset = _uis_bottomScrView.contentOffset;
//    offset.y = _uis_topScrView.contentOffset.y / 2;
//    [_uis_bottomScrView setContentOffset:offset];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
