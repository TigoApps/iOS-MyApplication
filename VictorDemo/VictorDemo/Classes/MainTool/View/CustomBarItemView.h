//
//  CustomBarItemView.h
//  AutoPartsClient
//
//  Created by qzh on 16/9/30.
//  Copyright © 2016年 ZhangyangNetwork. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^CustomBarItemViewBlock)();


/**
 * 自定义BarItem View
 */
@interface CustomBarItemView : UIView

@property(nonatomic, copy) NSString *titleMessage;

@property(nonatomic, strong) UIColor *titleColor;

@property(nonatomic, copy) CustomBarItemViewBlock tabBarBlock;


/**
 * 设置标题与图标
 */
-(void)setUpIcon:(NSString *)iconName titleMessage:(NSString *)titleMessage;

@end
