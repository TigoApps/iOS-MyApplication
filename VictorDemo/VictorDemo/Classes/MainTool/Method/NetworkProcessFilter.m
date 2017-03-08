//
//  NetworkProcessFilter.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/6/19.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "NetworkProcessFilter.h"

@implementation NetworkProcessFilter

-(NSDictionary *)processArgumentWithRequest:(NSDictionary *)argument query:(NSDictionary *)queryArgument
{
    NSMutableDictionary *newParameters = [[NSMutableDictionary alloc] initWithDictionary:argument];
    [newParameters setObject:[UIDevice appVersion] forKey:@"version"];
    return newParameters;
}

@end
