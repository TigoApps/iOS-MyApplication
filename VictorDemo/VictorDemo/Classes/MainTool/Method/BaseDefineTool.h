//
//  BaseDefineTool.h
//  UnitaSinceMedia
//
//  Created by qzh on 16/5/18.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#ifndef BaseDefineTool_h
#define BaseDefineTool_h

#pragma mark -- 打印

#ifdef DEBUG // 调试状态, 打开LOG功能
#define MMSLog(...) NSLog(__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
#define MMSLog(...)
#endif

#pragma mark -- 颜色
// 颜色
#define MMSColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 颜色
#define MMSColorWithAlpha(r, g, b, alpaha) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:alpaha]

// 随机色
#define MMSRandomColor (arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 是否为iOS8
#define IOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

#pragma mark -- 判断机型
// 是否为4inch
#define FourInch ([UIScreen mainScreen].bounds.size.height >= 568.0)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//国际化
#define D_LocalizedCardString(s) [[NSBundle mainBundle] localizedStringForKey:s value:nil table:@"Localizable"]

#pragma mark -- 屏幕宽高
// 屏幕宽尺寸
#define MMSScreenW [UIScreen mainScreen].bounds.size.width

// 屏幕高尺寸
#define MMSScreenH [UIScreen mainScreen].bounds.size.height

#pragma mark -- 设置View圆角
/// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

///  View加边框
#define ViewBorder(View, BorderColor, BorderWidth )\
\
View.layer.borderColor = BorderColor.CGColor;\
View.layer.borderWidth = BorderWidth;

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//设计图与运行设备比例
#define WidthProportion (MMSScreenW / 750)
#define HeightProportion (MMSScreenH / 1134)

#pragma mark -- 存储Key



/**App版本号*/
#define MMSAppVersion @"MMSAppVersion"
//保存推送信息
#define MMSNotifPushInfoKey @"MMSNotifPushInfoKey"
/**登陆验证码正在倒计时Key*/
#define CurrLoginCountdownTimeKey @"CurrLoginCountdownTimeKey"
/**登陆验证码保存正在倒计时Key*/
#define SaveLoginCountdownTimeKey @"SaveLoginCountdownTimeKey"
//访问图片服务器入口
#define ImageBasicUrlKey @"ImageBasicUrlKey"
//分享服务器入口
#define ShareBasicUrlKey @"ShareBasicUrlKey"

//本地轻存储Key -----end-------

//临时保存图片
#define EffectsPic @"EffectsPic"
#define TempEffectsPic @"TempEffectsPic"
#define TempPic @"TempPic"

//访问服务器入口
#define BaseUrl @"http://192.168.1.162:88/Victor/AppApi/index/test"


/**App签名*/
#define AppSignKey @"Victor"

#pragma mark --切换界面通知
#define ToRootViewController @"ToRootViewController"

//默认字体大小
#define TextSize24 24
#define TextSize18 18
#define TextSize16 16
#define TextSize15 15
#define TextSize14 14
#define TextSize13 13
#define TextSize12 12
#define TextSize11 11
#define TextSize10 10

/**加载分页数据条数*/
#define KLoadPageSize 10

/**Cell缩放动画时间*/
#define kAnimationDuration 1.0


#endif /* BaseDefineTool_h */
