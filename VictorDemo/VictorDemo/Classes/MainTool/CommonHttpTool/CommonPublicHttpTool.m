//
//  CommonPublicHttpTool.m
//  UnitaSinceMedia
//
//  Created by qzh on 16/7/16.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonPublicHttpTool.h"
#import <FMDB.h>

@implementation CommonPublicHttpTool

/** 数据库实例 */
static FMDatabase *_db;

+(void)initialize
{
    //打开数据库并创建表
    NSString *filePath = [NSFileManager GetDocumentPath];
    NSString *fileName = [filePath stringByAppendingPathComponent:@"AutoPartsClient.sqlite"];
    _db = [FMDatabase databaseWithPath:fileName];
    if (_db.open) {
        //创建表格
        BOOL result = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_area (id integer PRIMARY KEY AUTOINCREMENT, areas_id text NOT NULL, areas_name text NOT NULL, areas_type text NOT NULL, areas_key text, areas_sort integer);"];
        if (result) {
            MMSLog(@"创表成功");
        }else{
            MMSLog(@"创表失败");
        }
    }
}

+(void)queryCommonPublicConfigWithParams:(PublicRequestApi *)requestApi success:(void (^)(CommonPublicResponse *))success failure:(void (^)(NSString *))failure
{
    [self doResolveData:requestApi resultClass:[CommonPublicResponse class] success:^(id result) {
        MMSLog(@"%@",result);
        [self cachPublicConfigUrl:result];
    } failure:^(NSString *error) {
        MMSLog(@"%@",error);
    }];
}


/**
 *  缓存公共配置
 */
+(void)cachPublicConfigUrl:(CommonPublicResponse *)result
{
    //保存数据前将对应数据删除
//    [_db executeUpdateWithFormat:@"DELETE FROM t_area"];
//    for (AreaModel *model in result.data) {
//        [_db executeUpdate:@"INSERT INTO t_area (areas_id, areas_name, areas_type, areas_key, areas_sort) VALUES (?, ?, ?, ?, ?);",
//         model.areas_id, model.areas_name, model.areas_type, model.areas_key, model.areas_sort];
//    }
}

@end
