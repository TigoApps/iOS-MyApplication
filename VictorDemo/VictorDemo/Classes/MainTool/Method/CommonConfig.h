//
//  CommonConfig.h
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/5/22.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonSingleton.h"

@interface CommonConfig : NSObject

CommonSingletonH(CommonConfig)

/**轻存储存储数据*/
-(void)saveNSUserDefaults:(NSString *)key value:(id)value;

/**轻存储读取数据*/
-(id)readNSUserDefaults:(NSString *)key;

/**轻存储根据key删除某项*/
-(void)deleteNSUserDefaults:(NSString *)forKey;

/**存储当前倒计时状态*/
-(void)saveCountDownTimeState:(NSString *)currCountdownTimeKey saveTimeKey:(NSString *)saveTimeKey currCountDownTime:(NSInteger)currCountDownTime;

/**读取当前倒计时*/
-(int)queryCountDownTimeState:(NSString *)currCountdownTimeKey saveTimeKey:(NSString *)saveTimeKey;

/**
 *  获取图片加载url
 */
-(NSURL *)queryLoadImageUrlWith:(NSString *)imgUrl;

/**
 *  根据图片名称获取临时文件夹具体路径
 */
-(NSString *)queryTempPathWithFile:(NSString *)fileName fileFormat:(NSString *)fileFormat;

@end
