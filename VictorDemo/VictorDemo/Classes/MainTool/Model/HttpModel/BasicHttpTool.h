//
//  BasicHttpTool.h
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/6/20.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestApi.h"

/**
 *  网络请求、解析
 */
@interface BasicHttpTool : NSObject

/**
 *  合并参数调用方法
 */
+(void)doResolveData:(id)requestApi resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSString *))failure;

/**
 *  合并参数调用方法,返回上传进度
 */
+(void)doResolveDataWithProgress:(id)requestApi resultClass:(Class)resultClass progress:(void (^)(NSProgress *progress))progress success:(void(^)(id))success failure:(void (^)(NSString *))failure;

/**
 *  多请求统一回调方法
 */
+(void)doResolveDataWithArrayResponse:(LCBatchRequest *)requestApi resultClass:(NSArray *)resultClassArray success:(void(^)(id))success failure:(void (^)(NSString *))failure;

@end

