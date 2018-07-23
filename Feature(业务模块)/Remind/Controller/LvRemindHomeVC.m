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

@property (nonatomic,strong) UIButton *button1;

@property (nonatomic,strong) UIButton *button2;

@property (nonatomic,strong) UIButton *button3;

@property (nonatomic,strong) UIButton *button4;

@end

@implementation LvRemindHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubViews];
}


#pragma mark - init subviews
- (void)initSubViews {
    
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    [self.view addSubview:self.button3];
    [self.view addSubview:self.button4];
    

//    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button1.frame = CGRectMake(100, 100, 100, 25);
//    [button1 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
//    [button1 setTitle:@"接下来" forState:UIControlStateNormal];
//   //[button1 setTitleColor:[UIColor colorWithHexString:@"0x334455"]];
//    button1.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
//    [button1 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_Default imageTitleSpace:5.0];
//    button1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:button1];
//    
//    
//    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    button2.frame = CGRectMake(100, 150, 100, 25);
//    [button2 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
//    [button2 setTitle:@"接下来" forState:UIControlStateNormal];
//    [button2 setTitleColor:[UIColor colorWithRed:150/255.0 green:158/255.0 blue:174/255.0 alpha:1/1.0] forState:UIControlStateNormal];
//    button2.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
//    [button2 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_TitleOnLeft imageTitleSpace:5.0];
//    button2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:button2];

    //ceshi
    
    [self makeConstraint];

    
}

- (void)makeConstraint {
    
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).offset(100);
        make.width.mas_greaterThanOrEqualTo(100);
        make.height.mas_greaterThanOrEqualTo(25);
    }];
    
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.button1.mas_bottom).offset(25);
        make.width.mas_greaterThanOrEqualTo(100);
        make.height.mas_greaterThanOrEqualTo(25);
    }];
    
    [self.button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.button2.mas_bottom).offset(25);
        make.width.mas_greaterThanOrEqualTo(100);
        make.height.mas_greaterThanOrEqualTo(50);
    }];
    
    [self.button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.button3.mas_bottom).offset(25);
        make.width.mas_greaterThanOrEqualTo(100);
        make.height.mas_greaterThanOrEqualTo(50);
    }];
    
}


#pragma mark - Getter

- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button1 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
        [_button1 setTitle:@"接下来" forState:UIControlStateNormal];
        [_button1 setTitleColor:[UIColor colorWithRed:150/255.0 green:158/255.0 blue:174/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        _button1.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
        [_button1 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_Default imageTitleSpace:5.0];
        _button1.backgroundColor = [UIColor redColor];
    }
    return _button1;
}


- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button2 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
        [_button2 setTitle:@"接下来" forState:UIControlStateNormal];
        [_button2 setTitleColor:[UIColor colorWithRed:150/255.0 green:158/255.0 blue:174/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        _button2.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
        [_button2 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_TitleOnLeft imageTitleSpace:5.0];
        _button2.backgroundColor = [UIColor redColor];
    }
    return _button2;
}


- (UIButton *)button3 {
    if (!_button3) {
        _button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button3 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
        [_button3 setTitle:@"接下来" forState:UIControlStateNormal];
        [_button3 setTitleColor:[UIColor colorWithRed:150/255.0 green:158/255.0 blue:174/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        _button3.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
        [_button3 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_TitleOnTop imageTitleSpace:5.0];
        _button3.backgroundColor = [UIColor redColor];
        [self.view addSubview:_button3];
    }
    return _button3;
}


- (UIButton *)button4 {
    if (!_button4) {
        _button4 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button4 setImage:[UIImage imageNamed:@"icon_dashboard_next"] forState:UIControlStateNormal];
        [_button4 setTitle:@"接下来" forState:UIControlStateNormal];
        [_button4 setTitleColor:[UIColor colorWithRed:150/255.0 green:158/255.0 blue:174/255.0 alpha:1/1.0] forState:UIControlStateNormal];
        _button4.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18.0];
        [_button4 reLayoutButtonWithEdgeInsetsStyle:ButtonLayoutStyle_TitleOnButtom imageTitleSpace:5.0];
        _button4.backgroundColor = [UIColor redColor];
    }
    return _button4;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

