//
//  UploadFilesTool.h
//  AutoPartsClient
//
//  Created by WebUser on 16/10/20.
//  Copyright © 2016年 ZhangyangNetwork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadFilesTool : NSObject

// GET请求
+ (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(void (^)(NSDictionary * dictionary))success
                 failure:(void (^)(NSError * error))failure;


// POST请求
+ (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(void (^)(id success))success
                  failure:(void (^)(NSError *error))failure;

// 上传图片
+ (void)uploadWithURLString:(NSString *)URLString
                 parameters:(id)parameters
                 uploadData:(NSData *)uploadData
                 uploadName:(NSString *)uploadName
                   progress:(void (^)(NSProgress *uploadProgress))progress
                    success:(void (^)(id success))success
                    failure:(void (^)(NSError *error))failure;

// 上传多张图片
+ (void)uploadMostImageWithURLString:(NSString *)URLString
                          parameters:(id)parameters
                         uploadDatas:(NSMutableArray *)uploadDatas
                          uploadName:(NSString *)uploadName
                            progress:(void (^)(NSProgress *uploadProgress))progress
                             success:(void (^)(id success))success
                             failure:(void (^)(NSError *error))failure;


@end
