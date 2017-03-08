//
//  BaseEnumUtil.h
//  LongXiTechhnology
//
//  Created by LongXiTechhnology on 15/11/6.
//  Copyright © 2015年 LongXiTechhnology. All rights reserved.
//

/**
 全局枚举定义工具类
 */
#ifndef BaseEnumUtil_h
#define BaseEnumUtil_h


/**
 *  转场动画类型->字符
 *
 *  @param enum 枚举类型
 *
 *  @return
 */
#define reversibleAnimationsString(enum) [@[@"None", @"Portal", @"Cards", @"Fold", @"Explode", @"Flip", @"Turn", @"Crossfade", @"NatGeo", @"Cube",@"Pan"] objectAtIndex:enum]

/**
 *  转场动画类型
 */
typedef NS_ENUM(NSInteger, ReversibleAnimations) {
    /**
     *  默认类型
     */
    ReverAnimNone,
    /**
     *  开门
     */
    ReverAnimPortal,
    /**
     *  卡片
     */
    ReverAnimCards,
    /**
     *  折线
     */
    ReverAnimFold,
    /**
     *  放大渐变
     */
    ReverAnimExplode,
    /**
     *  翻页
     */
    ReverAnimFlip,
    /**
     *  翻转
     */
    ReverAnimTurn,
    /**
     *  渐变
     */
    ReverAnimCrossfade,
    /**
     *  NatGeo
     */
    ReverAnimNatGeo,
    /**
     *  3D旋转
     */
    ReverAnimCube,
    /**
     *  Pan
     */
    ReverAnimPan
};

/**
 *  Cell文字方向
 */
typedef NS_ENUM(NSInteger, CommonCellTextAlignment) {
    /**
     *  文字居左
     */
    CommonCellTextAlignmentLeft,
    /**
     *  文字居右
     */
    CommonCellTextAlignmentRight,
    /**
     *  文字居中
     */
    CommonCellTextAlignmentCenter
};

/**
 *  分享Model类型
 */
typedef NS_ENUM(NSInteger, ShareModelType) {
    /**
     *  微信好友
     */
    ShareModelTypeWithWeChatSession,
    /**
     *  微信朋友圈
     */
    ShareModelTypeWithWeChatTimeline,
    /**
     *  QQ好友
     */
    ShareModelTypeWithQQSession,
    /**
     *  QQ空间
     */
    ShareModelTypeWithQQzone,
    /**
     *  微博
     */
    ShareModelTypeWithWeiBo,
    /**
     *  QQ微博
     */
    ShareModelTypeWithQQWeiBo,
    /**
     *  FeekBook
     */
    ShareModelTypeWithFeekBook,
    /**
     *  Twitter
     */
    ShareModelTypeWithTwitter,
    /**
     *  AliPay
     */
    ShareModelTypeWithAliPay,
    /**
     *  WhatsApp
     */
    ShareModelTypeWithWhatsApp,
    /**
     *  Line
     */
    ShareModelTypeWithLine,
    /**
     *  收藏
     */
    ShareModelTypeWithCollection,
    /**
     *  短信
     */
    ShareModelTypeWithSMS,
    /**
     *  邮件
     */
    ShareModelTypeWithEmail,
    /**
     *  复制链接
     */
    ShareModelTypeWithCopy
};

/**
 *  分享类型
 */
typedef NS_ENUM(NSInteger, ShareContentType) {
    /**
     *  文本
     */
    ShareContentTypeWithText,
    /**
     *  大图
     */
    ShareContentTypeWithImage,
    /**
     *  网页
     */
    ShareContentTypeWithWebPage
};

/**
 *  我的点击类型
 */
typedef NS_ENUM(NSInteger, MyClickViewType) {
    /**
     *  我的订单
     */
    ClickViewTypeWithOrder,
    /**
     *  我的分销
     */
    ClickViewTypeWithDistribution,
    /**
     *  我的收藏
     */
    ClickViewTypeWithCollection,
    /**
     *  我的购物车
     */
    ClickViewTypeWithShopCat,
    /**
     *  我的银行卡
     */
    ClickViewTypeWithBankCar,
    /**
     *  分享推荐
     */
    ClickViewTypeWithShakeRecommend,
    /**
     *  关于我们
     */
    ClickViewTypeWithAboutUS,
    /**
     *  退出登录
     */
    ClickViewTypeWithLogout
};
/**
 *  图标位置类型
 */
typedef NS_ENUM(NSInteger, IconAlignmentType) {
    /**
     *  默认
     */
    IconAlignmentTypeWithNomal,
    /**
     *  左边
     */
    IconAlignmentTypeWithLeft,
    /**
     *  右边
     */
    IconAlignmentTypeWithRight
};
/**
 *  ActionSheetModel类型
 */
typedef NS_ENUM(NSInteger, ActionSheetModelType) {
    /**
     *  默认
     */
    SheetModelTypeWithNomal,
    /**
     *  系统相册
     */
    SheetModelTypeWithAlbum,
    /**
     *  系统相机
     */
    SheetModelTypeWithCamera,
    /**
     *  男
     */
    SheetModelTypeWithMan,
    /**
     *  女
     */
    SheetModelTypeWithFemale,
    /**
     *  保密
     */
    SheetModelTypeWithSecrecy,
    /**
     *  自定义类型
     */
    SheetModelTypeWithCustom,
    /**
     *  取消
     */
    SheetModelTypeWithCancel,
    /**
     *  手机号
     */
    SheetModelTypeWithPhone,
    /**
     *  昵称
     */
    SheetModelTypeWithNice
};

#endif /* BaseEnumUtil_h */
