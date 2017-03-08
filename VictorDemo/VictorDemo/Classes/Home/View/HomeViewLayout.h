//
//  HomeViewLayout.h
//  VictorDemo
//
//  Created by WebUser on 17/2/22.
//  Copyright © 2017年 victor. All rights reserved.
//

#import <MyLayout/MyLayout.h>
#import <SDCycleScrollView.h>

//整个界面的block声明
typedef void (^ClickedHeaderViewBlock)();

typedef void (^ClickPublishViewBlock)();
typedef void (^ClickOrderViewBlock)();
typedef void (^ClickDistributeBlock)();
typedef void (^ClickShopViewBlock)();
typedef void (^ClickShareViewBlock)();
typedef void (^ClickLogoutViewBlock)();

@interface HomeViewLayout : MyLinearLayout

@property(nonatomic,copy) ClickedHeaderViewBlock headerViewBlock;

@property(nonatomic,copy) ClickPublishViewBlock clickPublishBlock;
@property(nonatomic,copy) ClickOrderViewBlock clickOrderBlock;
@property(nonatomic,copy) ClickDistributeBlock clickDistributeBlock;
@property(nonatomic,copy) ClickShopViewBlock clickShopBlock;
@property(nonatomic,copy) ClickShareViewBlock clickShareBlock;
@property(nonatomic,copy) ClickLogoutViewBlock clickLogoutBlock;




/**开启轮播广告*/
-(void)onStartPlayImage;
/**关闭轮播广告*/
-(void)onStopPlayImage;


@end
