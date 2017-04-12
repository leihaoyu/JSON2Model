//
//  HYLChildTVC.m
//  HYLJSON2ModelDemo
//
//  Created by 雷浩宇 on 2017/4/12.
//  Copyright © 2017年 HYL. All rights reserved.
//

#import "HYLChildTVC.h"
#import "HYLAdult.h"


@interface HYLChildTVC ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@end

@implementation HYLChildTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HYLChild *child = self.child;
    
    self.nameLabel.text = child.name;
    self.genderLabel.text = child.gender;
    self.ageLabel.text = child.age;
}

@end
