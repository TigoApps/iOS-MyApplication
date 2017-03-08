//
//  BasicHttpTool.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/6/20.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "BasicHttpTool.h"

@implementation BasicHttpTool

+(void)doResolveData:(id)requestApi resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSString *))failure
{
    [requestApi startWithBlockSuccess:^(__kindof LCBaseRequest *request) {
        //解析数据
        MMSLog(@"\n 请求 url %@\n%@\n",[request urlString],[request rawJSONObject]);
        id keyValues = [request rawJSONObject];
        id resultObject = [resultClass mj_objectWithKeyValues:keyValues];
        if (success) {
            success(resultObject);
        }
    } failure:^(__kindof LCBaseRequest *request, NSError *error) {
        MMSLog(@"\n 请求 url %@\n",[request urlString]);
        NSDictionary *errorDictionary = [error userInfo];
        MMSLog(@"%@",errorDictionary);
        if (failure) {
            failure([NSString stringWithFormat:@"\n================= \n接口: %@ 请求失败\n=================\n",errorDictionary[@"NSErrorFailingURLKey"]]);
        }
    }];
}

+(void)doResolveDataWithProgress:(id)requestApi resultClass:(Class)resultClass progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSString *))failure
{
    [requestApi startWithBlockProgress:^(NSProgress *progre) {
        if (progress) {
            progress(progre);
        }
    } success:^(__kindof LCBaseRequest *request) {
        //解析数据
        MMSLog(@"\n 请求 url %@\n%@\n",[request urlString],[request rawJSONObject]);
        id resultObject = [resultClass mj_objectWithKeyValues:[request rawJSONObject]];
        if (success) {
            success(resultObject);
        }
    } failure:^(__kindof LCBaseRequest *request, NSError *error) {
        MMSLog(@"\n 请求 url %@\n",[request urlString]);
        NSDictionary *errorDictionary = [error userInfo];
        MMSLog(@"%@",errorDictionary);
        if (failure) {
            failure([NSString stringWithFormat:@"\n================= \n接口: %@ 请求失败\n=================\n",errorDictionary[@"NSErrorFailingURLKey"]]);
        }
    }];
}

+(void)doResolveDataWithArrayResponse:(LCBatchRequest *)requestApi resultClass:(NSArray *)resultClassArray success:(void (^)(id))success failure:(void (^)(NSString *))failure
{
    [requestApi startWithBlockSuccess:^(LCBatchRequest *request) {
        NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:resultClassArray.count];
        [resultClassArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Class resultClass = obj;
            id resultObject = [resultClass mj_objectWithKeyValues:[request.requestArray[idx] rawJSONObject]];
            [dataArray addObject:resultObject];
        }];
        if (success) {
            success(dataArray);
        }
    } failure:^(LCBatchRequest *request) {
        if (failure) {
            failure(@"网络异常");
        }
        
    }];
}


@end
