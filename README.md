# JSON2Model - 一个非常简单轻量级的JSON转模型框架

JSON2Model 关注于使用尽量方便、轻量。代码总共只有大约120行。



## 基本使用

比如JOSN内容如下:

```json
{"name": "Jim", "age": "19", "gender": "male"}
```

- 创建一个子类继承于HYLMetaEntity
- 在头文件中用JSON里的key名称声明属性

```objc
@interface HYLPerson : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end
```

- 在.m文件中用@dynamic关键字修饰属性

```objc
@implementation HYLPerson
@dynamic name;
@dynamic age;
@dynamic gender;
@end
```

- 数据转化为模型

```objc
HYLPerson *person = [[HYLPerson alloc] initWithDataFromDictionary:dic];
```



## 范例

### 字典转模型

```json
{
"name": "Jim",
"age": "19",
"gender": "male",
}
```

```objc
@interface HYLPerson : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end

```

### 模型里面嵌套模型

```json
{
"name": "Jim",
"age": "29",
"gender": "male",

"child": {"name": "LittleJim",
"age": "4",
"gender": "male"},
}
```

```objc
@interface HYLChild : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end

@interface HYLAdult : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) HYLChild *child;
@end
```

### 模型里面包含集合

```json
{
"name": "Jim",
"age": "39",
"gender": "male",

"dogs": [
{
"name": "Papy",
"age": "2",
"gender": "female",
},
{
"name": "Dogi",
"age": "1",
"gender": "male",
},
{
"name": "Wangcai",
"age": "6",
"gender": "male",
}
]
}
```

```objc
@interface HYLDog : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end

@interface HYLRichAdult : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSArray<HYLDog *>* dogs;
@end
```




# JSON2Model - Easily&Litly Data Modeling Framework for JSON

JSON2Model Just have about 120 lines of code.



## Basic Usage

Consider you have JSON like this:

```json
{"name": "Jim", "age": "19", "gender": "male"}
```

- create a HYLMetaEntity subclass for your data model
- declare properties in your header file with the name of the JSON keys:

```objc
@interface HYLPerson : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end
```

- in the implementation (`.m`) file use @dynamic keyword to all properties 

```objc
@implementation HYLPerson
@dynamic name;
@dynamic age;
@dynamic gender;
@end
```

- initialize your model with data:

```objc
HYLPerson *person = [[HYLPerson alloc] initWithDataFromDictionary:dic];
```



## Examples

### Automatic name based mapping

```json
{
"name": "Jim",
"age": "19",
"gender": "male",
}
```

```objc
@interface HYLPerson : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end

```

### Model cascading (models including other models)

```json
{
"name": "Jim",
"age": "29",
"gender": "male",

"child": {"name": "LittleJim",
"age": "4",
"gender": "male"},
}
```

```objc
@interface HYLChild : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end

@interface HYLAdult : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) HYLChild *child;
@end
```

### Model collections

```json
{
"name": "Jim",
"age": "39",
"gender": "male",

"dogs": [
{
"name": "Papy",
"age": "2",
"gender": "female",
},
{
"name": "Dogi",
"age": "1",
"gender": "male",
},
{
"name": "Wangcai",
"age": "6",
"gender": "male",
}
]
}
```

```objc
@interface HYLDog : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@end

@interface HYLRichAdult : HYLMetaEntity
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSArray<HYLDog *>* dogs;
@end
```

