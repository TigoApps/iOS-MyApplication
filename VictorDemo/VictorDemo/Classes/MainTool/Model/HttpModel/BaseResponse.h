//
//  BaseResponse.h
//  UnitaSinceMedia
//
//  Created by LongXi-Hua on 16/6/12.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  公共服务器返回
 */
@interface BaseResponse : NSObject

/**状态*/
@property(nonatomic, assign) BOOL status;

/**错误码*/
@property(nonatomic, assign) int errorCode;

/**错误信息*/
@property(nonatomic, copy) NSString *errorMsg;

/**true:正常业务错误errorMsg可以显示给用户查看,false:内部错误errorMsg不能显示给用户*/
@property(nonatomic, assign) BOOL isShow;

@end
