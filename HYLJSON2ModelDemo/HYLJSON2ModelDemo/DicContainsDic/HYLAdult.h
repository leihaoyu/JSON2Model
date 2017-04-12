//
//  HYLAdult.h
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "HYLMetaEntity.h"


@interface HYLChild : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end

@interface HYLDog : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end


@interface HYLAdult : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) HYLDog *dog;
@property (nonatomic, strong) HYLChild *child;
@end
