//
//  HYLSigleDicTVC.m
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "HYLSigleDicTVC.h"
#import "HYLPerson.h"

@interface HYLSigleDicTVC ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end

@implementation HYLSigleDicTVC

- (NSDictionary *)demoDic {
    return @{@"name": @"Jim",
             @"age": @"19",
             @"gender": @"male",
             };
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SingleDictionary";
    
    NSDictionary *dic = [self demoDic];
    
    HYLPerson *person = [[HYLPerson alloc] initWithDataFromDictionary:dic];
    
    self.nameLabel.text = person.name;
    self.genderLabel.text = person.gender;
    self.ageLabel.text = person.age;
}



@end
