//
//  CommonPublicResponseTool.m
//  UnitaSinceMedia
//
//  Created by qzh on 16/7/16.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonPublicResponseTool.h"

@implementation CommonPublicResponseTool

@end

#pragma mark ============== 公共配置 ================

@implementation CommonPublicResponse

+(void)load
{
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"data" : [AreaModel class]};
    }];
}

@end

#pragma mark =============== 公共配置Model ===========

@implementation AreaModel


@end
