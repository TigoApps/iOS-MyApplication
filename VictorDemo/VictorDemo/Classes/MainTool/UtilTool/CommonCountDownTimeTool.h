//
//  CommonCountDownTimeTool.h
//  FashionClothing
//
//  Created by LongXi-Hua on 16/5/30.
//  Copyright © 2016年 Amnice. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DidChangeBlock)(int second);
typedef void (^DidFinishedBlock)(BOOL nomalShutdown);


/**
 *  倒计时工具
 */
@interface CommonCountDownTimeTool : NSObject

+(instancetype)countDownTimeTool;

/**倒计时中回调*/
@property(nonatomic, copy) DidChangeBlock didChangeBlock;

/**倒计时完成*/
@property(nonatomic, copy) DidFinishedBlock didFinishedBlock;

@property(nonatomic, assign) int second;
@property(nonatomic, assign) int totalSecond;
/**是否正常关闭*/
@property(nonatomic, assign) BOOL isNormalShutdown;

/**开始*/
-(void)startWithSecond:(int)second;
/**停止*/
- (void)stop;


@end
