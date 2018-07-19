//
//  LvRemindHomeVC.m
//  MyCode
//
//  Created by TYFanrong on 2018/7/17.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "LvRemindHomeVC.h"
#import "Masonry.h"
#import "UIButton+Relayout.h"

@interface LvRemindHomeVC ()

@end

@implementation LvRemindHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubViews];
}


#pragma mark - init subviews
- (void)initSubViews {
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(100, 100, 100, 25);
    [button1 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
    [button1 setTitle:@"接下来" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor colorWithRed:150/255.0 green:158/255.0 blue:174/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
    [button1 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_Default imageTitleSpace:5.0];
    button1.backgroundColor = [UIColor redColor];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(100, 150, 100, 25);
    [button2 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
    [button2 setTitle:@"接下来" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor colorWithRed:150/255.0 green:158/255.0 blue:174/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
    [button2 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_TitleOnLeft imageTitleSpace:5.0];
    button2.backgroundColor = [UIColor redColor];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(100, 200, 100, 50);
    [button3 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
    [button3 setTitle:@"接下来" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor colorWithRed:150/255.0 green:158/255.0 blue:174/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
    [button3 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_TitleOnTop imageTitleSpace:5.0];
    button3.backgroundColor = [UIColor redColor];
    [self.view addSubview:button3];
    
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(100, 275, 100, 50);
    [button4 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
    [button4 setTitle:@"接下来" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor colorWithRed:150/255.0 green:158/255.0 blue:174/255.0 alpha:1/1.0] forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
    [button4 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_TitleOnButtom imageTitleSpace:5.0];
    button4.backgroundColor = [UIColor redColor];
    [self.view addSubview:button4];
    
    
    
    
    
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
