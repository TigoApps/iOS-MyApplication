//
//  CommonCustomTabBar.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/7/2.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonCustomTabBar.h"

@implementation CommonCustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加透明背景
        self.backgroundColor = [UIColor colorWithHexCode:@"#E3E3E3"];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    // 设置所有tabbarButton的frame
    [self setupAllTabBarButtonsFrame];
}

/**
 *  设置所有tabbarButton的frame
 */
-(void)setupAllTabBarButtonsFrame
{
    int index = 0;
    for (UIView *tabBarButton in self.subviews) {
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])continue;
        [self setupTabBarButtonFrame:tabBarButton atIndex:index];
        index++;
    }
}

-(void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    CGFloat bottonW = self.width / self.items.count;
    CGFloat bottonH = self.height;
    tabBarButton.width = bottonW;
    tabBarButton.height = bottonH;
    tabBarButton.x = bottonW * index;
    tabBarButton.y = 0;
}


@end
