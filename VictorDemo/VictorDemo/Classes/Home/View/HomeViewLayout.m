//
//  HomeViewLayout.m
//  VictorDemo
//
//  Created by WebUser on 17/2/22.
//  Copyright © 2017年 victor. All rights reserved.
//

#import "HomeViewLayout.h"
#import "CustomBarItemView.h"

@interface HomeViewLayout ()<SDCycleScrollViewDelegate>

@property(nonatomic, strong) SDCycleScrollView *imagePlayView;

@property(nonatomic, strong) NSMutableArray *childImageArray;

//我的发布
@property(nonatomic,strong) CustomBarItemView * publishView;
//我的订单
@property(nonatomic,strong) CustomBarItemView * orderView;
//我的分销
@property(nonatomic,strong) CustomBarItemView * distributionView;


//店铺简介
@property(nonatomic,strong) CustomBarItemView * shopIntroductView;
//分享推荐
@property(nonatomic,strong) CustomBarItemView * shareRecommendView;
//退出登录
@property(nonatomic,strong) CustomBarItemView * logoutView;

@end

@implementation HomeViewLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
#pragma mark---头部视图
        MyRelativeLayout *headerViewLayout = [[MyRelativeLayout alloc] init];
        headerViewLayout.widthDime.equalTo(self.widthDime);
        headerViewLayout.myHeight = 220;
        headerViewLayout.highlightedBackgroundColor = [UIColor lightGrayColor];
        headerViewLayout.highlightedOpacity = 0.5;
//        [headerViewLayout setTarget:self action:@selector(onClickedHeaderView:)];
        headerViewLayout.backgroundColor = [UIColor colorWithHexCode:@"#E3E3E3E3"];
        [self addSubview:headerViewLayout];
        [headerViewLayout addSubview:self.imagePlayView];
        
        //添加布局属性
        self.imagePlayView.heightDime.equalTo(headerViewLayout.heightDime);
        self.imagePlayView.widthDime.equalTo(headerViewLayout.widthDime);
        self.imagePlayView.centerYPos.equalTo(headerViewLayout.centerYPos);
        self.imagePlayView.centerXPos.equalTo(headerViewLayout.centerXPos);
        
        
#pragma mark---中间功能视图
        MyRelativeLayout * funcationTopLayout = [[MyRelativeLayout alloc]init];
        funcationTopLayout.wrapContentHeight = YES;
        funcationTopLayout.widthDime.equalTo(self.widthDime);
        funcationTopLayout.myTopMargin = 50;
        [self addSubview:funcationTopLayout];
        
        [funcationTopLayout addSubview:self.publishView];
        [funcationTopLayout addSubview:self.orderView];
        [funcationTopLayout addSubview:self.distributionView];
        
        //添加布局属性:第一行
        //发布
        self.publishView.leftPos.equalTo(funcationTopLayout.leftPos);
        self.publishView.heightDime.equalTo(self.publishView.widthDime).multiply(0.8);
        //订单
        self.orderView.leftPos.equalTo(self.publishView.rightPos).offset(1);
        self.orderView.heightDime.equalTo(self.orderView.widthDime).multiply(0.8);
        //分销
        self.distributionView.leftPos.equalTo(self.orderView.rightPos).offset(1);
        self.distributionView.heightDime.equalTo(self.distributionView.widthDime).multiply(0.8);
        self.distributionView.rightPos.equalTo(funcationTopLayout.rightPos);
        //平分父控件的宽度
        self.publishView.widthDime.equalTo(@[self.orderView.widthDime.add(-1),self.distributionView.widthDime]).add(-1);
        
        //添加布局属性：第二行
        MyRelativeLayout * funcationBottomLayout = [[MyRelativeLayout alloc]init];
        funcationBottomLayout.widthDime.equalTo(self.widthDime);
        funcationBottomLayout.wrapContentHeight = YES;
        funcationBottomLayout.myTopMargin = 1;
        [self addSubview:funcationBottomLayout];
        
        [funcationBottomLayout addSubview:self.shopIntroductView];
        [funcationBottomLayout addSubview:self.shareRecommendView];
        [funcationBottomLayout addSubview:self.logoutView];
        
        //店铺简介
        self.shopIntroductView.leftPos.equalTo(funcationTopLayout.leftPos);
        self.shopIntroductView.heightDime.equalTo(self.shopIntroductView.widthDime).multiply(0.8);
        //分享推荐
        self.shareRecommendView.leftPos.equalTo(self.shopIntroductView.rightPos).offset(1);
        self.shareRecommendView.heightDime.equalTo(self.shareRecommendView.widthDime).multiply(0.8);

        //退出登录
        self.logoutView.leftPos.equalTo(self.shareRecommendView.rightPos).offset(1);
        self.logoutView.heightDime.equalTo(self.logoutView.widthDime).multiply(0.8);
        self.logoutView.rightPos.equalTo(funcationBottomLayout.rightPos);
        //平分父控件宽度
        self.shopIntroductView.widthDime.equalTo(@[self.shareRecommendView.widthDime.add(-1),self.logoutView.widthDime]).add(-1);
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark-- Action
//我的发布点击事件
-(void)publishTapGestureClick{
    if (self.clickPublishBlock) {
        self.clickPublishBlock();
    }
}
//我的订单点击事件
-(void)orderTapGestureClick{
    if (self.clickOrderBlock) {
        self.clickOrderBlock();
    }
}

//我的分销点击事件
-(void)distributeTapGestureClick{
    if (self.clickDistributeBlock) {
        self.clickDistributeBlock();
    }
}
//店铺简介点击事件
-(void)shopTapGestureClick{
    if (self.clickShopBlock) {
        self.clickShopBlock();
    }
}
//分享推荐的点击事件
-(void)shareTapGestureClick{
    if (self.clickShareBlock) {
        self.clickShareBlock();
    }
}

//退出登录的点击事件
-(void)logoutTapGestureClick{
    if (self.clickLogoutBlock) {
        self.clickLogoutBlock();
    }
}


#pragma mark --私有方法
/**
 *  开启轮播广告
 */
-(void)onStartPlayImage
{
    if (self.imagePlayView && self.childImageArray.count > 1) {
        self.imagePlayView.autoScroll = YES;
        MMSLog(@"开始轮播");
    }
}

/**
 *  暂停轮播广告
 */
-(void)onStopPlayImage
{
    if (self.imagePlayView) {
        self.imagePlayView.autoScroll = NO;
        MMSLog(@"停止轮播");
    }
}

#pragma mark --SDCycleScrollViewDelegate
/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{

}
#pragma mark---懒加载
-(SDCycleScrollView *)imagePlayView
{
    if (!_imagePlayView) {
        _imagePlayView = [[SDCycleScrollView alloc] initWithFrame:CGRectZero];
        _imagePlayView.autoScrollTimeInterval = 4.0f;
        _imagePlayView.delegate = self;
        _imagePlayView.placeholderImage = [UIImage imageNamed:@""];
        _imagePlayView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _imagePlayView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _imagePlayView.backgroundColor = MMSColor(247, 247, 247);
        _imagePlayView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
        [_imagePlayView sizeToFit];
        _imagePlayView.localizationImageNamesGroup = self.childImageArray;
    }
    return _imagePlayView;
}

//发布
-(CustomBarItemView *)publishView
{
    if (!_publishView) {
        _publishView = [[CustomBarItemView alloc]init];
        [_publishView setUpIcon:@"icon_mypublish_image" titleMessage:@"发布"];
        _publishView.titleColor = [UIColor blackColor];
        _publishView.backgroundColor = [UIColor whiteColor];
        _publishView.userInteractionEnabled = YES;
        _publishView.tag = 1;
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]init];
        tapGesture.numberOfTapsRequired = 1;
        tapGesture.numberOfTouchesRequired = 1;
        [tapGesture addTarget:self action:@selector(publishTapGestureClick)];
        [_publishView addGestureRecognizer:tapGesture];
    }
    return _publishView;
}
//订单
-(CustomBarItemView *)orderView
{
    if (!_orderView) {
        _orderView = [[CustomBarItemView alloc] init];
        [_orderView setUpIcon:@"icon_myorder_image" titleMessage:@"订单"];
        _orderView.titleColor = [UIColor blackColor];
        _orderView.backgroundColor = [UIColor whiteColor];
        _orderView.userInteractionEnabled = YES;
        _orderView.tag = 2;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        tapGesture.numberOfTouchesRequired = 1;
        tapGesture.numberOfTapsRequired = 1;
        [tapGesture addTarget:self action:@selector(orderTapGestureClick)];
        [_orderView addGestureRecognizer:tapGesture];
    }
    return _orderView;
}

//我的分销
-(CustomBarItemView *)distributionView
{
    if (!_distributionView) {
        _distributionView = [[CustomBarItemView alloc] init];
        [_distributionView setUpIcon:@"icon_mysell_image" titleMessage:@"分销"];
        _distributionView.titleColor = [UIColor blackColor];
        _distributionView.backgroundColor = [UIColor whiteColor];
        _distributionView.userInteractionEnabled = YES;
        _distributionView.tag = 2;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        tapGesture.numberOfTouchesRequired = 1;
        tapGesture.numberOfTapsRequired = 1;
        [tapGesture addTarget:self action:@selector(distributeTapGestureClick)];
        [_distributionView addGestureRecognizer:tapGesture];
    }
    return _distributionView;
}
//店铺简介
-(CustomBarItemView *)shopIntroductView
{
    if (!_shopIntroductView) {
        _shopIntroductView = [[CustomBarItemView alloc] init];
        [_shopIntroductView setUpIcon:@"icon_shop_introduction_image" titleMessage:@"简介"];
        _shopIntroductView.titleColor = [UIColor blackColor];
        _shopIntroductView.backgroundColor = [UIColor whiteColor];
        _shopIntroductView.userInteractionEnabled = YES;
        _shopIntroductView.tag = 5;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        tapGesture.numberOfTouchesRequired = 1;
        tapGesture.numberOfTapsRequired = 1;
        [tapGesture addTarget:self action:@selector(shopTapGestureClick)];
        [_shopIntroductView addGestureRecognizer:tapGesture];
    }
    return _shopIntroductView;
}
//分享推荐
-(CustomBarItemView *)shareRecommendView
{
    if (!_shareRecommendView) {
        _shareRecommendView = [[CustomBarItemView alloc] init];
        [_shareRecommendView setUpIcon:@"icon_myshare_image" titleMessage:@"推荐"];
        _shareRecommendView.titleColor = [UIColor blackColor];
        _shareRecommendView.backgroundColor = [UIColor whiteColor];
        _shareRecommendView.userInteractionEnabled = YES;
        _shareRecommendView.tag = 6;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        tapGesture.numberOfTouchesRequired = 1;
        tapGesture.numberOfTapsRequired = 1;
        [tapGesture addTarget:self action:@selector(shareTapGestureClick)];
        [_shareRecommendView addGestureRecognizer:tapGesture];
    }
    return _shareRecommendView;
}

//退出登录
-(CustomBarItemView *)logoutView
{
    if (!_logoutView) {
        _logoutView = [[CustomBarItemView alloc] init];
        [_logoutView setUpIcon:@"icon_exitout_image" titleMessage:@"退出"];
        _logoutView.titleColor = [UIColor blackColor];
        _logoutView.backgroundColor = [UIColor whiteColor];
        _logoutView.userInteractionEnabled = YES;
        _logoutView.tag = 8;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
        tapGesture.numberOfTouchesRequired = 1;
        tapGesture.numberOfTapsRequired = 1;
        [tapGesture addTarget:self action:@selector(logoutTapGestureClick)];
        [_logoutView addGestureRecognizer:tapGesture];
    }
    return _logoutView;
}
-(NSMutableArray *)childImageArray
{
    if (!_childImageArray) {
        _childImageArray = [NSMutableArray array];
        [_childImageArray addObject:@"temp1.jpg"];
        [_childImageArray addObject:@"temp2.jpg"];
        [_childImageArray addObject:@"temp3.jpg"];
        [_childImageArray addObject:@"temp4.jpg"];
    }
    return _childImageArray;
}

@end

