//
//  CarGroup.m
//  汽车品牌
//
//  Created by 黄宾宾 on 4/15/15.
//  Copyright (c) 2015 黄宾宾. All rights reserved.
//

#import "CarGroup.h"
#import "Car.h"

@implementation CarGroup
+(instancetype)carGroupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        self.title=dict[@"title"];
        
        //从cargroup模型中取出字典数组cars
        NSArray *dictArray=dict[@"cars"];
        //创建新的数组
        NSMutableArray *carArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Car *car=[Car carWithDict:dict];
            //把创建的car模型加入carArray
            [carArray addObject:car];
        }
        //赋值
        _cars=carArray;
    }
    return self;
}
@end
