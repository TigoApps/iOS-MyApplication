//
//  CommonSingleton.h
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/5/22.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//  单例

// .h文件
#define CommonSingletonH(name) \
+ (instancetype)shared##name;

// .m文件
#define CommonSingletonM(name) \
static id _instance = nil; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}
