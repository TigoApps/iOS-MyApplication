//
//  CommonPublicRequestTool.m
//  UnitaSinceMedia
//
//  Created by qzh on 16/7/16.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonPublicRequestTool.h"

@implementation CommonPublicRequestTool

@end

#pragma mark ============ 公共配置请求 ===============

@implementation PublicRequestApi

-(instancetype)initWithRequestApi
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSString *)apiMethodName
{
    return @"/Index/getAreaList";
}

@end
