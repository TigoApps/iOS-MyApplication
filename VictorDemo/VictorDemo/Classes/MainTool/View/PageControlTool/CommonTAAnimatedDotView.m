//
//  CommonTAAnimatedDotView.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/5/21.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonTAAnimatedDotView.h"

static CGFloat const kAnimateDuration = 1;

@implementation CommonTAAnimatedDotView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (void)setDotColor:(UIColor *)dotColor
{
    _dotColor = dotColor;
    self.layer.borderColor  = dotColor.CGColor;
}

- (void)initialization
{
    _dotColor = [UIColor whiteColor];
    self.backgroundColor    = [UIColor clearColor];
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
    self.layer.borderColor  = [UIColor whiteColor].CGColor;
    self.layer.borderWidth  = 2;
}


- (void)changeActivityState:(BOOL)active
{
    if (active) {
        [self animateToActiveState];
    } else {
        [self animateToDeactiveState];
    }
}


- (void)animateToActiveState
{
    [UIView animateWithDuration:kAnimateDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:-20 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = _dotColor;
        self.transform = CGAffineTransformMakeScale(1.4, 1.4);
    } completion:nil];
}

- (void)animateToDeactiveState
{
    [UIView animateWithDuration:kAnimateDuration delay:0 usingSpringWithDamping:.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end
