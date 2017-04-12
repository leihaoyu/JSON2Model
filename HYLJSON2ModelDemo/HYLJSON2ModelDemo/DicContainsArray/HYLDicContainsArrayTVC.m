//
//  HYLDicContainsArrayTVC.m
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "HYLDicContainsArrayTVC.h"
#import "HYLRichAdult.h"
#import "HYLDisplayArrayTVC.h"

@interface HYLDicContainsArrayTVC ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@property (nonatomic, strong) NSArray *children;
@property (nonatomic, strong) NSArray *dogs;
@end

@implementation HYLDicContainsArrayTVC
- (NSDictionary *)demoDic {
    return @{@"name": @"Jim",
             @"age": @"39",
             @"gender": @"male",
             
             @"dogs": @[@{@"name": @"Papy",
                          @"age": @"2",
                          @"gender": @"female",},
                        @{@"name": @"Dogi",
                          @"age": @"1",
                          @"gender": @"male",},
                        @{@"name": @"Wangcai",
                          @"age": @"6",
                          @"gender": @"male",},],
             
             @"children": @[@{@"name": @"LittleJim",
                              @"age": @"4",
                              @"gender": @"male"},
                            @{@"name": @"Halen",
                              @"age": @"2",
                              @"gender": @"female"},
                            @{@"name": @"Jimi",
                              @"age": @"10",
                              @"gender": @"male"},
                            @{@"name": @"James",
                              @"age": @"14",
                              @"gender": @"male"}, ],
             };
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DicContainsArray";

    NSDictionary *dic = [self demoDic];
    
    HYLRichAdult *adult = [[HYLRichAdult alloc] initWithDataFromDictionary:dic];
    
    self.nameLabel.text = adult.name;
    self.genderLabel.text = adult.gender;
    self.ageLabel.text = adult.age;
    self.children = adult.children;
    self.dogs = adult.dogs;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Dogs"]) {
        HYLDisplayArrayTVC *tvc = segue.destinationViewController;
        tvc.array = self.dogs;
    } else if ([segue.identifier isEqualToString:@"Children"]) {
        HYLDisplayArrayTVC *tvc = segue.destinationViewController;
        tvc.array = self.children;
    }
}



@end
