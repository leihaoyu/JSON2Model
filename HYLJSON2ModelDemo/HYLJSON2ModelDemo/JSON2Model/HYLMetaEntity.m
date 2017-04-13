//
//  HYLMetaEntity.m

//
//  Created by MyApple on 15/6/27.
//  Copyright (c) 2015年 Henry. All rights reserved.
//

#import "HYLMetaEntity.h"
#import <objc/runtime.h>


@interface HYLMetaEntity ()
@property (strong, nonatomic) NSMutableDictionary *backingStore;
@property (nonatomic) SEL mySel;
@end

@implementation HYLMetaEntity

- (instancetype)initWithDataFromDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}


- (instancetype)init {
    self = [super init];
    if (self) {
        _backingStore = [NSMutableDictionary dictionary];

        u_int count;
        objc_property_t *properties= class_copyPropertyList([self class], &count);
        for (int i = 0; i < count ; i++)
        {
            const char* propertyName = property_getName(properties[i]);
            NSString *strName = [NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            Method originalMethod = class_getInstanceMethod([self class], NSSelectorFromString(strName));
            if (originalMethod) {
                class_addMethod([self class], NSSelectorFromString(strName), (IMP)myDictionaryGetter, "@@:");
            }
        }
        free(properties);
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selString = NSStringFromSelector(sel);
    if ([selString hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)myDictionarySetter, "v@:@");
    } else {
        class_addMethod(self, sel, (IMP)myDictionaryGetter, "@@:");
    }
    return YES;
}

static id myDictionaryGetter(id self, SEL _cmd) {
    if (![self isKindOfClass:[HYLMetaEntity class]]) {
        return nil;
    }
    HYLMetaEntity *typedSelf = (HYLMetaEntity *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    NSString *key = NSStringFromSelector(_cmd);
    return [backingStore objectForKey:key];
}

static void myDictionarySetter(id self,SEL _cmd, id value) {
    HYLMetaEntity *typedSelf = (HYLMetaEntity *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    NSString *selString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selString mutableCopy];
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if (value) {
        processSetObject(backingStore, value, key);
    } else {
        [backingStore removeObjectForKey:key];
    }
}

//2017-02-25
static void processSetObject(NSMutableDictionary *store, id obj, NSString *key){

    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        
        HYLMetaEntity *metaEntity = [[HYLMetaEntity alloc] initWithDataFromDictionary:obj];
        [store setObject:metaEntity forKey:key];
    }
    else if ([obj isKindOfClass:[NSArray class]]){
        NSMutableArray *muArr = [NSMutableArray array];
        for (id object in obj) {
            if ([object isKindOfClass:[NSDictionary class]]) {
                HYLMetaEntity *metaEntity = [[HYLMetaEntity alloc] initWithDataFromDictionary:object];
                [muArr addObject:metaEntity];
            } else {
                [muArr addObject:object];
            }
        }
        [store setObject:muArr forKey:key];
    }
    else{
       
        [store setObject:obj forKey:key];
    }
}


+ (NSMutableArray *)hylMetaClass_creatArrayWithJSONArray:(NSArray *)array {
    NSMutableArray *muArr = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        if ([dic isKindOfClass:[NSDictionary class]]) {
            HYLMetaEntity *obj = [[self alloc] initWithDataFromDictionary:dic];
            
            [muArr addObject:obj];
        }
    }
    
    return muArr;
}

@end

