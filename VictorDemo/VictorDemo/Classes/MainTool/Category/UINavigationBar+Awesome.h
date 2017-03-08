//
//  UINavigationBar+Awesome.h
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/7/12.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UINavigationBar扩展
 */
@interface UINavigationBar (Awesome)
/**
 *  设置背景色
 */
- (void)mm_setBackgroundColor:(UIColor *)backgroundColor;
/**
 *  设置透明
 */
- (void)mm_setElementsAlpha:(CGFloat)alpha;
/**
 *  根据滑动更改
 */
- (void)mm_setTranslationY:(CGFloat)translationY;
/**
 *  重新设置
 */
- (void)mm_reset;

@end
