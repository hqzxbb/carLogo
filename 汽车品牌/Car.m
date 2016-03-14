//
//  Car.m
//  汽车品牌
//
//  Created by 黄宾宾 on 4/15/15.
//  Copyright (c) 2015 黄宾宾. All rights reserved.
//

#import "Car.h"

@implementation Car
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)carWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
