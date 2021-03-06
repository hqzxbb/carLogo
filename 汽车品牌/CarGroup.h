//
//  CarGroup.h
//  汽车品牌
//
//  Created by 黄宾宾 on 4/15/15.
//  Copyright (c) 2015 黄宾宾. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
@interface CarGroup : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,strong)NSArray *cars;
+(instancetype)carGroupWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
