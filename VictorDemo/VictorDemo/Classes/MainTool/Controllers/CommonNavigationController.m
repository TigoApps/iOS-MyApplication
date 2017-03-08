//
//  CommonNavigationController.m
//  FashionClothing
//
//  Created by Amnice on 16/5/27.
//  Copyright © 2016年 Amnice. All rights reserved.
//

#import "CommonNavigationController.h"

@interface CommonNavigationController ()

@end

@implementation CommonNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏图标颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //隐藏返回按钮文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    //设置标题颜色
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:21], NSFontAttributeName, nil]];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    [super pushViewController:viewController animated:animated];
}


@end
