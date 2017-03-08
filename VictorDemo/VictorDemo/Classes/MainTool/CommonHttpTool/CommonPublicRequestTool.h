//
//  CommonPublicRequestTool.h
//  UnitaSinceMedia
//
//  Created by qzh on 16/7/16.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestApi.h"

/**
 *  公共配置Request请求参数整合工具
 */
@interface CommonPublicRequestTool : NSObject

@end

#pragma mark ============ 公共配置请求 ===============

@interface PublicRequestApi : BaseRequestApi

-(instancetype)initWithRequestApi;

@end
