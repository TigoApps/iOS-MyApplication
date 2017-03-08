//
//  BaseRequestApi.h
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/6/19.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <LCNetwork/LCNetwork.h>

/**
 *  公共网络请求Request工具(默认Get请求,子类更改请重写requestMethod方法)
 */
@interface BaseRequestApi : LCBaseRequest<LCAPIRequest>

@end
