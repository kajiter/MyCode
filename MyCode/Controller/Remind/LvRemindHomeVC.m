//
//  LvRemindHomeVC.m
//  MyCode
//
//  Created by TYFanrong on 2018/7/17.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "LvRemindHomeVC.h"
#import "Masonry.h"

@interface LvRemindHomeVC ()

@end

@implementation LvRemindHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}


#pragma mark - init subviews
- (void)initSubViews {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addNewHabits:)];
}


- (void)makeConstraint {
    
}


#pragma mark - event
- (void)addNewHabits:(UIBarButtonItem *)sender {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
