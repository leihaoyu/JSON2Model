//
//  NSMutableArray+HYLEntity.m
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "NSMutableArray+HYLEntity.h"
#import "HYLMetaEntity.h"

@implementation NSMutableArray (HYLEntity)
+ (instancetype)HYLMeta_arrayWithJSONArray:(NSArray *)array {
    NSMutableArray *muArr = [self array];
    for (NSDictionary *dic in array) {
        if ([dic isKindOfClass:[NSDictionary class]]) {
            HYLMetaEntity *obj = [[HYLMetaEntity alloc] initWithDataFromDictionary:dic];
            
            [muArr addObject:obj];
        }
    }
    
    return muArr;
}
@end
