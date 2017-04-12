//
//  HYLMetaEntity.h

//
//  Created by MyApple on 15/6/27.
//  Copyright (c) 2015年 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYLMetaEntity : NSObject
/*
 *用于接收JSON解析后的字典数据，一次性存入自定义的类
 *
 *用法，自定义类继承自此类，用下面这个init方法传入解析后的字典即可。
 *注意：
 *1.不需要担心遇到系统关键字了。
 *2.声明属性后，.m文件里面用@dynamic 修饰属性。
 */
- (instancetype)initWithDataFromDictionary:(NSDictionary *)dictionary;

+ (NSMutableArray *)hylMetaClass_creatArrayWithJSONArray:(NSArray *)array;

@end


