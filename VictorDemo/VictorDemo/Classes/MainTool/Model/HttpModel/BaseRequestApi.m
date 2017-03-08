//
//  BaseRequestApi.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/6/19.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "BaseRequestApi.h"

@implementation BaseRequestApi

-(NSString *)apiMethodName
{
    return @"";
}

-(LCRequestMethod)requestMethod
{
    return LCRequestMethodGet;
}

-(NSDictionary *)requestHeaderValue
{
    return @{@"AppVer" : [UIDevice appVersion]};
}

-(LCRequestSerializerType)requestSerializerType
{
    return LCRequestSerializerTypeJSON;
}

@end
