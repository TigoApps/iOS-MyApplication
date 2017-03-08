//
//  AppDelegate.m
//  VictorDemo
//
//  Created by WebUser on 16/12/4.
//  Copyright © 2016年 victor. All rights reserved.
//

#import "AppDelegate.h"

#import "NetworkProcessFilter.h"
#import "CommonTabBarController.h"
#import "CommonControllerTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //设置网络配置
    [self setupNetworkConfig];

    //由远程通知启动
    NSDictionary* message = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (message) {
        //存储信息
        //由远程通知启动
        [[CommonConfig sharedCommonConfig] saveNSUserDefaults:MMSNotifPushInfoKey value:message];
        [CommonControllerTool chooseRootViewController:YES];
    }else {
        [CommonControllerTool chooseRootViewController:NO];
    }
    
    //设置监听通知
    [self setupNotification];
    return YES;
}
/**
 * 添加监听通知
 */
-(void)setupNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMainControllerSucess:) name:ToRootViewController object:nil];
}


/**
 *  设置网络请求框架
 */
-(void)setupNetworkConfig
{
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    config.mainBaseUrl = BaseUrl;
}



/**
 * RootController切换
 */
-(void)showMainControllerSucess:(NSNotification *)notification
{
    [self showHomePageControllerSuccess];
}

-(void)showHomePageControllerSuccess
{
    CommonTabBarController *tabBarController = [CommonTabBarController initCommonTabBarController];
    self.window.rootViewController = tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
