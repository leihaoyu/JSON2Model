//
//  NSMutableArray+HYLEntity.h
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (HYLEntity)
+ (instancetype)HYLMeta_arrayWithJSONArray:(NSArray *)array;
@end
