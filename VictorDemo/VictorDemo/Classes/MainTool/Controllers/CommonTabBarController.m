//
//  CommonTabBarController.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/7/2.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonTabBarController.h"

#import "MessageViewController.h"
#import "HomeViewController.h"
#import "MyViewController.h"

#import "CommonCustomTabBar.h"

#import "CommonPublicHttpTool.h"

@interface CommonTabBarController ()

@property(nonatomic, weak) HomeViewController *homePageController;
@property(nonatomic, weak) MessageViewController *messageController;
@property(nonatomic, weak) MyViewController *myController;

@end

@implementation CommonTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化TabBatController
    [self initTabBatController];
    //创建自定义tabbar
    [self addCustomTabBar];
    //判断首选展示的Item
    [self setupSelectedItemIndex];
    //加载网络公共配置
    [self onLoadPublicConfog];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+(instancetype)initCommonTabBarController
{
    return [[self alloc] init];
}

/**
 *  创建自定义tabbar
 */
-(void)addCustomTabBar
{
    CommonCustomTabBar *cusTabBar = [[CommonCustomTabBar alloc] init];
    //更换系统自带的tabbar
    [self setValue:cusTabBar forKey:@"tabBar"];
}



/**
 *  初始化TabBatController
 */
-(void)initTabBatController
{
    MessageViewController *messageController = [[MessageViewController alloc] init];
    [self addChildTabItem:messageController title:@"消息" imageName:@"icon_message_n" selectedImageName:@"icon_message_s"];
    self.messageController = messageController;
    
    HomeViewController *homePageController = [[HomeViewController alloc] init];
    [self addChildTabItem:homePageController title:@"首页" imageName:@"icon_home_n" selectedImageName:@"icon_home_s"];
    self.homePageController = homePageController;
    
    MyViewController *myController = [[MyViewController alloc] init];
    [self addChildTabItem:myController title:@"我的" imageName:@"icon_my_n" selectedImageName:@"icon_my_s"];
    self.myController = myController;
    
}


/**
 *  添加tabBar子控制器
 *
 *  @param childVC           子控制器对象
 *  @param title             标题
 *  @param imageName         未选中图标名称
 *  @param selectedImageName 选中图标名称
 */
-(void)addChildTabItem:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //设置标题
    //childVC.title = title;
    childVC.tabBarItem.title = title;
    //设置控件未选中图标
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //设置字体普通状态颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //设置文字选中颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexCode:@"#01a0f3"];
    [childVC.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    //设置控件选中图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    //禁止图片渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = selectedImage;
    
    //添加导航控制器
    CommonNavigationController *commonNavigation = [[CommonNavigationController alloc] initWithRootViewController:childVC];
    [commonNavigation.navigationBar mm_setBackgroundColor:[UIColor colorWithHexCode:@"#01a0f3"]];
    [self addChildViewController:commonNavigation];
}

/**
 *  设置展示那个页面
 */
-(void)setupSelectedItemIndex
{
    //解析推送信息
    self.selectedIndex = 1;
    
}

/**
 *  加载公共配置
 */
-(void)onLoadPublicConfog
{
//    PublicRequestApi *requestApi = [[PublicRequestApi alloc] initWithRequestApi];
//    //暂定不需要任何处理
//    [CommonPublicHttpTool queryCommonPublicConfigWithParams:requestApi success:nil failure:nil];
}


@end
