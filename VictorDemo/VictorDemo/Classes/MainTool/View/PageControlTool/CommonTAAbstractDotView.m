//
//  CommonTAAbstractDotView.m
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/5/21.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import "CommonTAAbstractDotView.h"

@implementation CommonTAAbstractDotView

- (id)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}


- (void)changeActivityState:(BOOL)active
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}

@end
