//
//  UIButton+Extension.m
//  LongXiTechhnology
//
//  Created by admin on 15/9/2.
//  Copyright (c) 2015年 DragonSealTechnology. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

- (void)setBackgroundColorNormal:(UIColor *)normalColor highlightedColor:(UIColor *)highlightedColor
{
    [self setBackgroundImage:[UIImage imageWithColor:normalColor] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageWithColor:highlightedColor] forState:UIControlStateHighlighted];
} 

-(void)buttonWithNomalImageName:(NSString *)nomalImageName SelectedImageName:(NSString *)selectedImageName
{
    [self setImage:[UIImage imageNamed:nomalImageName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateHighlighted];
}

-(void)buttonWithNormalTitleColor:(UIColor *)normalColor highlightedTitleColor:(UIColor *)highlightedColor
{
    normalColor = normalColor ? normalColor : [UIColor whiteColor];
    highlightedColor = highlightedColor ? highlightedColor : [UIColor whiteColor];
    
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
}

+(UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
        [button setTitleColor:titleColor forState:UIControlStateHighlighted];
    }
    if (backgroundColor) {
        [button setBackgroundColor:backgroundColor];
    }
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)setupFillet:(BOOL)isFillet radian:(CGFloat)radian
{
    if (isFillet) {
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:radian];
    }
}


#pragma mark - button倒计时
- (void)setTheCountdownStartWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color {
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL,0), 1.0 * NSEC_PER_SEC,0);
    dispatch_source_set_event_handler(_timer, ^{
        
        //倒计时结束，关闭
        if (timeOut == 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setBackgroundColor:mColor forState:UIControlStateNormal];
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled =YES;
            });
        } else {
            int seconds = timeOut % 60;
            NSString *timeStr = [NSString stringWithFormat:@"%0.1d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setBackgroundColor:color forState:UIControlStateNormal];
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle]forState:UIControlStateNormal];
                self.userInteractionEnabled =NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}
@end
