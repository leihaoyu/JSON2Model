//
//  HYLDicContainsDicTVC.m
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "HYLDicContainsDicTVC.h"
#import "HYLAdult.h"
#import "HYLDogTVC.h"
#import "HYLChildTVC.h"

@interface HYLDicContainsDicTVC ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@property (nonatomic, strong) HYLChild *child;
@property (nonatomic, strong) HYLDog *dog;
@end

@implementation HYLDicContainsDicTVC
- (NSDictionary *)demoDic {
    return @{@"name": @"Jim",
             @"age": @"29",
             @"gender": @"male",
             
             @"dog": @{@"name": @"Papy",
                       @"age": @"2",
                       @"gender": @"female",},
             
             @"child": @{@"name": @"LittleJim",
                         @"age": @"4",
                         @"gender": @"male"},
             };
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DicContainsDic";

    NSDictionary *dic = [self demoDic];
    
    HYLAdult *adult = [[HYLAdult alloc] initWithDataFromDictionary:dic];
    
    self.nameLabel.text = adult.name;
    self.genderLabel.text = adult.gender;
    self.ageLabel.text = adult.age;
    self.child = adult.child;
    self.dog = adult.dog;
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Dog"]) {
        HYLDogTVC *tvc = segue.destinationViewController;
        tvc.dog = self.dog;
    } else if ([segue.identifier isEqualToString:@"Child"]) {
        HYLChildTVC *tvc = segue.destinationViewController;
        tvc.child = self.child;
    }
}


@end
