//
//  CommonTAAbstractDotView.h
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/5/21.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonTAAbstractDotView : UIView

/**
 *  A method call let view know which state appearance it should take. Active meaning it's current page. Inactive not the current page.
 *
 *  @param active BOOL to tell if view is active or not
 */
- (void)changeActivityState:(BOOL)active;

@end
