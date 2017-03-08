//
//  NSString+MMExtension.h
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/7/8.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MMExtension)

/**
 *  md5字符串加密
 */
+(NSString *)md5String:(NSString *)sourceString;

/**
 *  md5字符串加密
 */
-(NSString *)md5String;

/**
 *  手机号码验证
 */
+ (BOOL) isMobile:(NSString *)mobileNumbel;

/**
 * 动态读取UILabel的高度
 */
+(CGSize)dynamicReadTextSize:(NSString *)title width:(CGFloat)width font:(CGFloat)font;
@end
