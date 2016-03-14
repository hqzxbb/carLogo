//
//  Car.h
//  汽车品牌
//
//  Created by 黄宾宾 on 4/15/15.
//  Copyright (c) 2015 黄宾宾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property (nonatomic,copy)NSString * icon;
@property (nonatomic,copy)NSString * name;
+(instancetype)carWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
