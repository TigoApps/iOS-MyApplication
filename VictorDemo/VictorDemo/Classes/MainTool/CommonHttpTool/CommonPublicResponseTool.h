//
//  CommonPublicResponseTool.h
//  UnitaSinceMedia
//
//  Created by qzh on 16/7/16.
//  Copyright © 2016年 UnitaCreate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseResponse.h"

/**
 *  公共配置服务器返回工具
 */
@interface CommonPublicResponseTool : NSObject

@end


#pragma mark ============== 公共配置 ================

@interface CommonPublicResponse : BaseResponse

@property(nonatomic, strong) NSArray *data;

@end







#pragma mark =============== 公共配置Model ===========

@interface AreaModel : NSObject

/**地区ID*/
@property(nonatomic, copy) NSString *areas_id;
/**地区名*/
@property(nonatomic, copy) NSString *areas_name;
/**地区级别 0:省 1:市 2:区*/
@property(nonatomic, copy) NSString *areas_type;
/**首字母,一般只有市级才会有*/
@property(nonatomic, copy) NSString *areas_key;
/**热门程度,原则上数字越大热度越靠前,与app约定等于50的为热门地区*/
@property(nonatomic, assign) int areas_sort;

@end

