//
//  UIButton+Extension.h
//  LongXiTechhnology
//
//  Created by admin on 15/9/2.
//  Copyright (c) 2015年 DragonSealTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

/**设置普通、高亮颜色*/
- (void)setBackgroundColorNormal:(UIColor *)normalColor highlightedColor:(UIColor *)highlightedColor;

/**设置文字普通、高亮颜色*/
- (void)buttonWithNormalTitleColor:(UIColor *)normalColor
                     highlightedTitleColor:(UIColor *)highlightedColor;

+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
              backgroundColor:(UIColor *)backgroundColor
                       target:(id)target
                       action:(SEL)action;

/**设置普通、高亮图片*/
-(void)buttonWithNomalImageName:(NSString *)nomalImageName SelectedImageName:(NSString *)selectedImageName;

/**设置圆角、弧度*/
-(void)setupFillet:(BOOL)isFillet radian:(CGFloat)radian;

/**设置倒计时*/
- (void)setTheCountdownStartWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;

@end
