//
//  HYLRichAdult.h
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "HYLMetaEntity.h"
#import "HYLAdult.h"



@protocol HYLHaveName <NSObject>

@property NSString *name;

@end

@interface HYLRichAdult : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSArray<HYLDog *>* dogs;
@property (nonatomic, strong) NSArray<HYLChild *>* children;
@end
