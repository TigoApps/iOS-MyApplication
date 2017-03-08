//
//  CommonCustomTabBar.h
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/7/2.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommonCustomTabBar;

@protocol CommonCustomTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedPlusButton:(CommonCustomTabBar *)tabBar;

@end

/**
 *  自定义TabBar
 */
@interface CommonCustomTabBar : UITabBar

@property (nonatomic, weak) id<CommonCustomTabBarDelegate> tabBarDelegate;

@end
