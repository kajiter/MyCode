//
//  DetailViewController.m
//  MyCode
//
//  Created by CL on 2018/4/20.
//  Copyright © 2018年 CL. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) UILabel *label;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.centerY.mas_equalTo(self.view.mas_centerY).mas_offset(-100);
        make.height.mas_equalTo(100);
    }];

    self.label.text = [NSString stringWithFormat:@"账号是：%@\n 密码是：%@",self.model.userName,self.model.passWord ];
}


-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.text = @"";
        _label.textColor = [UIColor redColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 2;
        _label.font = [UIFont systemFontOfSize:22];
    }
    return _label;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
