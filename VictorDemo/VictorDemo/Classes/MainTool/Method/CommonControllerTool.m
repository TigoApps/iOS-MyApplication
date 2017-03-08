//
//  CommonControllerTool.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/7/2.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonControllerTool.h"
#import "CommonTabBarController.h"

@implementation CommonControllerTool

+(void)chooseRootViewController:(BOOL)openWithNotification
{
    // 从沙盒中取出上次存储的软件版本号(取出用户上次的使用记录)
//    NSString *lastVersion = [[CommonConfig sharedCommonConfig] readNSUserDefaults:MMSAppVersion];
    //获取当前版本号
//    NSString *currentVersion = [UIDevice appVersion];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    CommonTabBarController *tabBarController = [CommonTabBarController initCommonTabBarController];
    window.rootViewController = tabBarController;
//    //是否有推送信息
//    if (openWithNotification || [currentVersion isEqualToString:lastVersion]) {
//        //有推送消息
//        CommonTabBarController *tabBarController = [CommonTabBarController initCommonTabBarController];
//        [self toOtherControllers:tabBarController window:window];
//    }else{
//        //写入版本到沙盒
//        [[CommonConfig sharedCommonConfig] saveNSUserDefaults:MMSAppVersion value:currentVersion];
//        NewFeaturesController *newFeatures = [[NewFeaturesController alloc] init];
//        [self toOtherControllers:newFeatures window:window];
//    }
}

//+(void)toOtherControllers:(UIViewController *)controller window:(UIWindow *)window
//{
//    id navigationController = controller;
//    if (![controller isKindOfClass:[NewFeaturesController class]]) {
//        navigationController = [[USMNavigationController alloc] initWithRootViewController:controller];
//    }
//    window.rootViewController = navigationController;
//}


@end
