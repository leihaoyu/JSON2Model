//
//  HYLSingleArrayTVC.m
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "HYLSingleArrayTVC.h"
#import "HYLPerson.h"

@interface HYLSingleArrayTVC ()
@property (nonatomic, strong) NSArray<HYLPerson *>* persons;
@end

@implementation HYLSingleArrayTVC
- (NSArray *)demoDic {
    return @[@{@"name": @"Jim",
               @"age": @"19",
               @"gender": @"male",
             },
             @{@"name": @"Wade",
               @"age": @"26",
               @"gender": @"female",
               },
             @{@"name": @"West",
               @"age": @"32",
               @"gender": @"male",
               },
             @{@"name": @"Jordan",
               @"age": @"21",
               @"gender": @"male",
               },
             @{@"name": @"Harry",
               @"age": @"11",
               @"gender": @"male",
               },
             @{@"name": @"Jinne",
               @"age": @"12",
               @"gender": @"female",
               },];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SingleArray";
    
    NSArray *arr = [self demoDic];
    
    self.persons = [HYLPerson hylMetaClass_creatArrayWithJSONArray:arr];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.persons.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    HYLPerson *person = self.persons[indexPath.row];
    
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.age;
    
    return cell;
}



@end
