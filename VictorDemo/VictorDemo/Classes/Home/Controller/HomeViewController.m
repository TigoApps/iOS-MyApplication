//
//  HomeViewController.m
//  VictorDemo
//
//  Created by WebUser on 17/2/22.
//  Copyright © 2017年 victor. All rights reserved.
//

#import "HomeViewController.h"


#import "HomeViewLayout.h"

@interface HomeViewController ()

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) HomeViewLayout *homeView;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    [self setupChildView];
}

/**
 * 添加子视图
 */
-(void)setupChildView
{
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.view = self.scrollView;
    [self.scrollView addSubview:self.homeView];
}



#pragma mark --  懒加载

-(HomeViewLayout *)homeView
{
    if (!_homeView) {
        _homeView = [HomeViewLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
        _homeView.myLeftMargin = 0;
        _homeView.myRightMargin = 0;
        //同时指定左右边距为0表示宽度和父视图一样宽
        _homeView.heightDime.lBound(self.scrollView.heightDime,10,0.5);
        //高度虽然是wrapContentHeight的。但是最小的高度不能低于父视图的高度加10.
    }
    return _homeView;
}

@end
