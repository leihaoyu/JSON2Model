//
//  HYLDogTVC.m
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "HYLDogTVC.h"
#import "HYLAdult.h"

@interface HYLDogTVC ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@end

@implementation HYLDogTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HYLDog *dog = self.dog;
    
    self.nameLabel.text = dog.name;
    self.genderLabel.text = dog.gender;
    self.ageLabel.text = dog.age;
}


@end
