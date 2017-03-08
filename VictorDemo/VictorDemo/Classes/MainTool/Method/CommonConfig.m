//
//  CommonConfig.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/5/22.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonConfig.h"

@implementation CommonConfig

CommonSingletonM(CommonConfig)

/**
 *  将数据存储到轻存储
 */
-(void)saveNSUserDefaults:(NSString *)key value:(id)value
{
    //注意：对相同的Key赋值约等于一次覆盖，要保证每一个Key的唯一性
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

/**
 *  读取轻存储数据
 *
 *  @param key 轻存储key
 *
 *  @return
 */
-(id)readNSUserDefaults:(NSString *)key
{
    id result = nil;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    result = [defaults objectForKey:key];
    return result;
}

/**
 *  根据key删除轻存储数据
 *
 *  @param forKey
 */
-(void)deleteNSUserDefaults:(NSString *)forKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:forKey];
    [defaults synchronize];
}

/**存储当前倒计时状态*/
-(void)saveCountDownTimeState:(NSString *)currCountdownTimeKey saveTimeKey:(NSString *)saveTimeKey currCountDownTime:(NSInteger)currCountDownTime
{
    //将即时时间写入轻存储
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    [self saveNSUserDefaults:currCountdownTimeKey value:@(time)];
    //保存倒计时时间
    [self saveNSUserDefaults:saveTimeKey value:@(currCountDownTime)];
}

/**读取当前倒计时*/
-(int)queryCountDownTimeState:(NSString *)currCountdownTimeKey saveTimeKey:(NSString *)saveTimeKey
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSNumber *lastTime = [self readNSUserDefaults:currCountdownTimeKey];
    int lastSaveTime = [[self readNSUserDefaults:saveTimeKey] intValue];
    int count = time - [lastTime integerValue];
    if (lastSaveTime - count > 0) {
        return lastSaveTime - count;
    }
    return 0;
}

//获取图片加载url
-(NSURL *)queryLoadImageUrlWith:(NSString *)imgUrl
{
    NSString *imageUrl = [NSString stringWithFormat:@"%@/%@",[self readNSUserDefaults:ImageBasicUrlKey],imgUrl];
    return [NSURL URLWithString:imageUrl];
}

/**
 *  根据图片名称获取临时文件夹具体路径
 */
-(NSString *)queryTempPathWithFile:(NSString *)fileName fileFormat:(NSString *)fileFormat
{
    if (fileFormat == nil || [@"" isEqualToString:fileFormat]) {
        return [[NSFileManager CreateList:[NSFileManager GetTmpPath] ListName:@"cacheImg"] stringByAppendingFormat:@"/%@",fileName];
    }else {
        return [[NSFileManager CreateList:[NSFileManager GetTmpPath] ListName:@"cacheImg"] stringByAppendingFormat:@"/%@.%@",fileName,fileFormat];
    }
}

@end
