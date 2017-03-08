//
//  UIImage+Extension.h
//  AutoPartsClient
//
//  Created by WebUser on 16/10/27.
//  Copyright © 2016年 ZhangyangNetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

//图片压缩到指定大小
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
