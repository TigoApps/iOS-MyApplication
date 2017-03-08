//
//  CommonCountDownTimeTool.m
//  FashionClothing
//
//  Created by LongXi-Hua on 16/5/30.
//  Copyright © 2016年 Amnice. All rights reserved.
//

#import "CommonCountDownTimeTool.h"

@interface CommonCountDownTimeTool()

@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, strong) NSDate *startDate;

@end

@implementation CommonCountDownTimeTool

+(instancetype)countDownTimeTool
{
    return [[self alloc] init];
}

-(void)setDidChangeBlock:(DidChangeBlock)didChangeBlock
{
    _didChangeBlock = [didChangeBlock copy];
}

-(void)setDidFinishedBlock:(DidFinishedBlock)didFinishedBlock
{
    _didFinishedBlock = [didFinishedBlock copy];
}


#pragma -mark count down method
-(void)startWithSecond:(int)totalSecond
{
    _totalSecond = totalSecond;
    _second = totalSecond;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}

-(void)timerStart:(NSTimer *)theTimer {
    double deltaTime = [[NSDate date] timeIntervalSinceDate:_startDate];
    _second = _totalSecond - (int)(deltaTime + 0.5);
    if (_second < 0)
    {
        self.isNormalShutdown = YES;
        [self stop];
    }else{
        if (_didChangeBlock)
        {
            _didChangeBlock(_second);
            MMSLog(@"倒数中 -- %d (秒)",_second);
        }
    }
}

- (void)stop{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _second = _totalSecond;
                if (_didFinishedBlock)
                {
                    //倒计时完成
                    _didFinishedBlock(self.isNormalShutdown);
                }
            }
        }
    }
}



@end
