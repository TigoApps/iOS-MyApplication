//
//  CommonPublicHttpTool.h
//  UnitaSinceMedia
//
//  Created by qzh on 16/7/16.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "BasicHttpTool.h"
#import "CommonPublicRequestTool.h"
#import "CommonPublicResponseTool.h"

/**
 *  读取公共配置文件接口
 */
@interface CommonPublicHttpTool : BasicHttpTool

/**
 *  获取公共配置  
 */
+(void)queryCommonPublicConfigWithParams:(PublicRequestApi *)requestApi success:(void(^)(CommonPublicResponse *result))success failure:(void(^)(NSString *error))failure;

@end
