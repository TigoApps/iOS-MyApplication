//
//  NSObject+MMExtension.m
//  UnitaSinceMedia
//
//  Created by qzh on 16/9/26.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "NSObject+MMExtension.h"

@implementation NSObject (MMExtension)

+ (nonnull NSString *)mm_identifier {
    return NSStringFromClass(self.class);
}

@end
